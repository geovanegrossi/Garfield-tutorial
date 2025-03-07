# Instale o gmsh, Elmer, root e o Garfield++

O arquivo contendo a geometria do problema é o standard_GEM.geo.

## Crie a lista de arquivos .msh para uso no Elmer com o seguinte comando:

	gmsh standard_GEM.geo -3 -order 2 -optimize

## Faça a conversão desse arquivo para o formato lido pelo Elmer com o comando:

	ElmerGrid 14 2 standard_GEM.msh 

Copie os arquivos da pasta gerada(standard_GEM) para o diretório do arquivo .sif

## Para resolver o problema pelo método de elementos fínito no Elmer execute o comando:

	ElmerSolver Field.sif

e também:

	ElmerSolver Field_WTlel.sif

Então faça:

	mkdir build && cd build
	cmake ..
	make


>[!IMPORTANT] Confira os campos utilizando:
	./viewfield

Para calcular uma avalanche use:
	./completeavalanche

Modifique o que quiser e se divirta!

//----------------------------------------------------------------------------------------


# Install gmsh, Elmer, root and Garfield++

The geometry file is the standard_GEM.geo.

## Create your file .msh to be used with Elmer with the following terminal command:

	gmsh standard_GEM.geo -3 -order 2 -optimize

## Convert the file executing the command:

	ElmerGrid 14 2 standard_GEM.msh 

Copy all files from the new directory(standard_GEM) to the .sif file directory 

## To solve the finity element method execute:

	ElmerSolver Field.sif

also:

	ElmerSolver Field_WTlel.sif

than:
	mkdir build && cd build
	cmake ..
	make


>[!IMPORTANT] Look to the fields using:
	./viewfield

To calculate an avalanche:
	./completeavalanche

Change everything you want and have fun!

