
	#include <iostream>
	#include <cmath> 
	#include <cstring>
	#include <fstream>
	#include <TCanvas.h>
	#include <TApplication.h>
	#include <TFile.h>
	
	#include "Garfield/ComponentElmer.hh"
	#include "Garfield/ViewField.hh"
	#include "Garfield/MediumMagboltz.hh"
	#include "Garfield/Sensor.hh"
	#include "Garfield/AvalancheMicroscopic.hh"
	#include "Garfield/AvalancheMC.hh"
	#include "Garfield/Random.hh"
	#include "Garfield/Plotting.hh"

	using namespace Garfield;
	using namespace std;

	int main(int argc, char * argv[]) 
		{
			
		TApplication app("app", &argc, argv);

		//variáveis para salvar diretório dos arquivos inputs
		char* result = new char[150];		
		char* elements = new char[150];
		char* nodes = new char[150];
		char* header = new char[150];
		char* dielectrics = new char[150];
		char* wtlel =new char[150];
		
		//arquivos txt criados com as posições iniciais e finais dos elétrons e deois íons
		char* electronpos = new char[150];	
		char* ionpos = new char[150];

		//coloque aqui o diretório de cada um dos arquivos
		sprintf(result,"Field.result"); 	
		sprintf(elements,"mesh.elements");
		sprintf(nodes,"mesh.nodes");
		sprintf(header,"mesh.header");
		sprintf(wtlel,"Field_WTlel.result");
		sprintf(dielectrics,"dielectrics.dat");
			
		//cria arquivos para guardar a posição inicial, final e status dos elétrons e dos íons
		sprintf(electronpos,"electronposition.txt");
		sprintf(ionpos,"ionposition.txt");


		// Dimensão do problema em cm.
		const double axis_x = 1.0;             // Largura em X da região onde a simulação irá acontecer
		const double axis_y = 1.0;             // Largura em Y da região onde a simulação irá acontecer
		const double axis_z = 0.05;		       // Distancia em Z da região onde a simulação irá acontecer

		//Concentração de gases
		double ArgonConcent = 90.0;
		double CO2Concent = 10.0;
		


		// Define o meio de interação e as característica do gás
		MediumMagboltz* gas = new MediumMagboltz();
		gas -> SetTemperature(293.15);                  // Temperature [K]
    		gas -> SetPressure(740.);                       // Pressure [Torr]
    		gas -> EnableDrift();
    		gas -> SetComposition("ar", ArgonConcent, "co2", CO2Concent);   // Ar/CO2 90:10
    		gas -> SetMaxElectronEnergy(200.);              // Energy [eV]
    		gas -> EnableDebugging();
    		gas -> Initialise();
    		gas -> DisableDebugging();
		const std::string path = getenv("GARFIELD_HOME");
		gas->LoadIonMobility(path + "/Data/IonMobility_Ar+_Ar.txt");

		//double rp=0.45; //valor para de transferencia do efeito penning
    		//gas -> EnablePenningTransfer(rp, 0.0, "ar"); //habilita o efeito penning

						
		// Importa os arquivos do Elmer para serem utilizados
		ComponentElmer * elm = new ComponentElmer(header,elements,nodes,dielectrics,result,"micron"); //load em todos os mesh gerados pelo gmsh e .result do elmer
		elm->EnableMirrorPeriodicityY();		//Periodicidade espelhada em X
		elm->EnableMirrorPeriodicityX();		//Periodicidade espelhada em Y
		elm->SetWeightingField(wtlel,"wtlel");	//.result do WTlel field
		elm -> SetMedium(0, gas);				//Meio ioniantes
		elm -> PrintMaterials();				//Printa os materiais na tela
		elm -> PrintRange();					//Printa as dimensões na Tela
				  
		// Configura o sensor
		Sensor* sensor = new Sensor();
		sensor->AddComponent(elm);
		sensor->SetArea(-1*axis_x,-1*axis_y,-1*axis_z,axis_x,axis_y,axis_z); //Região onde a simulação irá acontecer
		sensor->AddElectrode(elm,"wtlel");	//Adiona eletrodo caso queria fazer a coleta de sinais
			
		//Classe para a deriva dos elétrons	

		AvalancheMicroscopic* aval = new AvalancheMicroscopic();
		aval->SetSensor(sensor);
		aval->SetCollisionSteps(100);
		aval->EnableSignalCalculation();
		
		//Classe para a deriva dos íons
			 
		AvalancheMC* drift = new AvalancheMC();	
		drift->SetSensor(sensor);
		drift->SetDistanceSteps(5.e-4);
		drift->EnableSignalCalculation();
		
		//Variáveis para guardar posição inicial e final dos eletrons 
		double xe1, ye1, ze1, te1, ee1;
		double xe2, ye2, ze2, te2, ee2;
		int e_status;    
		
		//Variáveis para guardar posição inicial e final dos ions
		double xi1, yi1, zi1, ti1;
		double xi2, yi2, zi2, ti2;
		int i_status;	
		
		double xi=0;		//posição inicial dos elétrons soltos na simulação
		double yi=0;
		double zi=0.049;	

		
		int nAva=5; //Número de avalanches unicas


		for (int i = 0; i < nAva ; i++){
		std::cout<<"Calculando avalanche: "<< i << endl;	
		std::fstream fpositionion;
		std::fstream fpositionelectron;

		//Inicia a avalanche dos eletrons
			
		aval->AvalancheElectron(xi, yi, zi, 0, 0, 0., 0., 0.);

	
		const int nElec = aval->GetNumberOfElectronEndpoints();  //Número de elétrons gerados na avalanche

			for (int l=0; l<nElec; l++) //Loop em nElec para recuperar a posição dos elétrons e fazer a deriva dos ions
				{	
				aval->GetElectronEndpoint(l, xe1, ye1, ze1, te1, ee1, xe2, ye2, ze2, te2, ee2, e_status);	//Guarda a posição do eletron
				drift->DriftIon(xe1, ye1, ze1, te1);		//Calcula a deriva do ion na posição onde um eletron foi gerado
				drift->GetIonEndpoint(0, xi1, yi1, zi1, ti1, xi2, yi2, zi2, ti2, i_status); // Guarda a posição do ion
				

				fpositionelectron.open(electronpos, std::fstream::out | std::fstream::app); //Abre o arquivo txt e printa as posições dos eletrons
				fpositionelectron << l << ' ' << xe1 << ' ' << ye1 << ' ' << ze1 << ' ' << te1 << ' ' << ee1 << ' ' << xe2 << ' ' << ye2 << ' ' << ze2 << ' ' << te2 << ' ' << ee2 << ' ' << e_status << std::endl; 
				fpositionelectron.close();  //fecha o txt
				
				
				fpositionion.open(ionpos, std::fstream::out | std::fstream::app); //Abre o arquivo txt e printa as posições dos íons
				fpositionion << l << ' ' << xi1 << ' ' << yi1 << ' ' << zi1 << ' ' << ti1 << ' ' << 0 << ' ' << xi2 << ' ' << yi2 << ' ' << zi2 << ' ' << ti2 << ' ' << 0 << ' ' << i_status << std::endl; //
				fpositionion.close();  //Fecha o txt
			
				}
			
		}
			
	return 0;
	}

