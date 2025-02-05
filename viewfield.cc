
	#include <iostream>
	#include <cmath> 
	#include <cstring>
	#include <fstream>
	#include <TCanvas.h>
	#include <TApplication.h>
	#include <TFile.h>

	#include "Garfield/MediumMagboltz.hh"
	#include "Garfield/ComponentElmer.hh"
	#include "Garfield/ViewField.hh"
	#include "Garfield/Plotting.hh"
	#include "Garfield/ViewFEMesh.hh"
	#include "Garfield/ViewSignal.hh"
	#include "Garfield/GarfieldConstants.hh"
	#include "Garfield/Random.hh"
	#include "Garfield/AvalancheMicroscopic.hh"
	#include "Garfield/AvalancheMC.hh"

	using namespace Garfield;
	using namespace std;

	int main(int argc, char * argv[]) {    


		TApplication app("app", &argc, argv);

		//variáveis para salvar diretório dos arquivos inputs
		char* result = new char[150];		
		char* elements = new char[150];
		char* nodes = new char[150];
		char* header = new char[150];
		char* dielectrics = new char[150];
		char* wtlel =new char[150];
		
		//coloque aqui o diretório de cada um dos arquivos
		sprintf(result,"Field.result"); 	
		sprintf(elements,"mesh.elements");
		sprintf(nodes,"mesh.nodes");
		sprintf(header,"mesh.header");
		sprintf(wtlel,"Field_WTlel.result");
		sprintf(dielectrics,"dielectrics.dat");			


		// Dimensão do problema em cm.
		const double axis_x = 1.0;             // Largura em X da região onde a simulação irá acontecer
		const double axis_y = 1.0;             // Largura em Y da região onde a simulação irá acontecer
		const double axis_z = 0.05;		       // Distancia em Z da região onde a simulação irá acontecer

		//Concentração de gases
		double ArgonConcent = 90.0;
		double CO2Concent = 10.0;
		
		// Define o meio de interação e as característica do gás
		MediumMagboltz* gas = new MediumMagboltz();
		gas -> SetTemperature(293.15);                  // Temperatura [K]
	    	gas -> SetPressure(740.);                       // Pressão [Torr]
	    	gas -> EnableDrift();
	    	gas -> SetComposition("ar", ArgonConcent, "co2", CO2Concent);   // Ar/CO2 90:10
	    	gas -> SetMaxElectronEnergy(200.);              // Energia [eV]
	    	gas -> EnableDebugging();
	    	gas -> Initialise();
	    	gas -> DisableDebugging();
						
		// Importa os arquivos do Elmer para serem utilizados
		ComponentElmer * elm = new ComponentElmer(header,elements,nodes,dielectrics,result,"micron"); //load em todos os mesh gerados pelo gmsh e .result do elmer
		elm->EnableMirrorPeriodicityY();		//Periodicidade espelhada em X
		elm->EnableMirrorPeriodicityX();		//Periodicidade espelhada em Y
		elm->SetWeightingField(wtlel,"wtlel");	//.result do WTlel field
		elm -> SetMedium(0, gas);				//Meio 
		elm -> PrintMaterials();				//Printa os materiais na tela
		elm -> PrintRange();					//Printa as dimensões na Tela
		
		//Mostra o campo elétrico no interior de um dos furos
		TCanvas* eField = new TCanvas("eField", "Electric Field");
		ViewField * vf = new ViewField();
		vf->SetComponent(elm);
		vf->SetArea(-0.01*axis_x,-0.01*axis_y,0.01*axis_x,0.01*axis_y);	
		vf->SetNumberOfSamples2d(300,600);
		vf->SetPlane(0,-1,0,0,0,0);
		vf->SetCanvas(eField);
		vf->PlotContour("v");	//a opção "v" faz o potencial
		eField->Draw();
		//eField->SaveAs("electric_field.pdf");

		//Calcula o campo elétrico ao longo de uma linha que passa pelo interior de um dos furos		
		TCanvas* eProfileElectricField = new TCanvas("eProfileElectricField", "Electric Field Profile");
		ViewField * pf = new ViewField();
		pf->SetComponent(elm);  
		pf->SetArea(-0.01*axis_x,-0.01*axis_y,0.01*axis_x,0.01*axis_y);
		pf->SetNumberOfContours(40);
		pf->SetPlane(0,1,0,0,0,0);
		pf->SetCanvas(eProfileElectricField);
		pf->PlotProfile(0,0,-axis_z,0,0,axis_z,"e");
		//~ eProfileElectricField->SaveAs("EletricProfile.pdf");
	   

		std::cout << "end" << std::endl;
		app.Run(kTRUE);	//Comente essa linha para fechar os histogramas

		return 0;
	}
