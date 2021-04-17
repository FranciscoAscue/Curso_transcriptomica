#!/bin/bash
### Preinstalaciones para el curso de Transcriptomica
### Francisco Ascue Orosco
### gmail: francisco.ascue131@gmail.com

normal=$'\e[0m'                          
bold=$(tput bold)                         # make colors bold/bright
red="$bold$(tput setaf 1)"                # bright red text
green=$(tput setaf 2)                     # dim green text
fawn=$(tput setaf 3); beige="$fawn"       # dark yellow text
yellow="$bold$fawn"                       # bright yellow text
darkblue=$(tput setaf 4)                  # dim blue text
blue="$bold$darkblue"                     # bright blue text
purple=$(tput setaf 5); magenta="$purple" # magenta text
pink="$bold$purple"                       # bright magenta text
darkcyan=$(tput setaf 6)                  # dim cyan text
cyan="$bold$darkcyan"                     # bright cyan text
gray=$(tput setaf 7)                      # dim white text
darkgray="$bold"$(tput setaf 0)           # bold black = dark gray text
white="$bold$gray"                        # bright white text


if [ $UID -ne 0 ]
then
	sudo /bin/bash $0 $* && exit $?
	echo "${red}Se ha producido un error al ejecutar el script!${normal} ${cyan}Revisar las dependencias!${normal}"
	exit 1
fi


echo "${green}........................................................................................................................................"
echo "........................................................................................................................................"
echo "........................................................................................................................................"
echo ".......................................................${red}Instalación inicio: `date`${normal}${green}................................."
echo "........................................................................................................................................"
echo "........................................................................................................................................"
echo "........................................................................................................................................${normal}"

####### Inicio de actualizaciones

if [ -x $(command -v apt) ]
then
	sudo apt update
	echo "${green}.............................................................................................."
	echo ".............................................................................................."
	echo ".................................${normal}${darkcyan}INSTALANDO PRERREQUISITOS${normal}${green}..................................."
	echo ".............................................................................................."
	echo "..............................................................................................${normal}"
	sudo apt-get install git wget curl
	sudo apt-get install python3 python3-pyqt5.qtsvg python3-pyqt5 python3-pyqt5.qtsvg python3-pip

	if [ -x $(command -v pip3) ]
	then
		set -e 
		###
		echo "${darkblue}"
		sudo -H pip3 install --upgrade pip
		echo "${darkcyan}.............................................................................................."
		echo "...................................${normal}${cyan} INSTALANDO JUPYTER ${normal}${darkcyan}......................................."
		echo "...............................................................................................${normal}"
		pip3 install ipykernel
		pip3 install jupyter
	fi

	set -e

	echo "${green}------------------------------------${normal}${yellow}Instalando Kernel de BASH${green}--------------------------------"
	sudo apt-get install libzmq3-dev libcurl4-openssl-dev libssl-dev jupyter-core jupyter-client
	pip3 install bash_kernel
	python3 -m bash_kernel.install
	
	echo "${darkcyan}-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "------------------------------------${cyan}INSTALACION DE PROGRAMAS DE BIOINFORMATICA${darkcyan}-----------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"
	echo "-----------------------------------------------------------------------------------------------------------------"

	sudo apt-get install gcc make-guile build-essential libexpat1-dev fastqc cutadapt samtools subread sortmerna rna-star ncbi-entrez-direct trimmomatic -y
	## directorio de ejecutables

	mkdir -p Programas/bin
	PGM="$PWD/Programas"
	export PATH='${PGM}/bin:$PATH' >> ~/.bashrc

fi

echo "${normal}"
#pip3 install gffutils	
#pip3 install bcbio-gff	
#pip3 install HTseq
#pip3 install multiqc

echo "${green}........................................................................................................................................"
echo "........................................................................................................................................"
echo "........................................................................................................................................"
echo "..............................................${cyan}Termino el `date`${normal}.............................................................."
echo "........................................................................................................................................"
echo "........................................................................................................................................"

echo "${green}Los programas se han instalado correctamente"
