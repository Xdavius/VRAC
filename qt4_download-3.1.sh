#!/bin/bash

#source
source ./progress_bar.sh

#En-tête du script

function start() {
clear
echo "
---------------------- Qt4 Debian Buster ------------------

Ce script permet de télécharger qt4 et libqt4 depuis Buster
Un répertoire ./QT4 sera créé.

Tapez 1 pour lancer, ctrl+c pour annuler

-----------------------------------------------------------
" 
read -p 'Votre choix : ' choix

if [ $choix == 1 ];
then
    main
else
    start
fi
}

#Début du script

function script() {

mkdir -p QT4
cd QT4

######
draw_progress_bar 0

apt-cache search 'qt' | grep ^'qt' | grep -v 'i386' | grep -v 'dbg' | cut -d / -f 1 | grep '4' | cut -d " " -f 1 > qt4.list

nombre_de_fichiers_qt4=$(wc -l qt4.list | cut -d " " -f 1)

echo -e "
\n -- $nombre_de_fichiers_qt4 fichiers seront téléchargés
"

cat qt4.list

######
draw_progress_bar 10

apt-cache search 'libqt' | grep ^'libqt' | grep -v 'i386' | grep -v 'dbg' | cut -d / -f 1 | grep '4' | cut -d " " -f 1 > libqt4.list

nombre_de_fichiers_libqt4=$(wc -l libqt4.list | cut -d " " -f 1)
echo -e "
\n -- $nombre_de_fichiers_libqt4 fichiers seront téléchargés
"

cat libqt4.list

######
draw_progress_bar 20

echo -e "
Début des téléchargements dans 5 secondes. Appuyez sur ctrl+c pour annuler.
"
sleep 5

# Boucles FOR

#######
FILENAME="qt4.list"
LINES=$(cat $FILENAME)
COUNTER=$((80-$nombre_de_fichiers_qt4-$nombre_de_fichiers_libqt4))

for LINE in $LINES
do
 draw_progress_bar $COUNTER
 apt-get download "$LINE"
 COUNTER=$((COUNTER+1))
done

########
FILENAME="libqt4.list"
LINES=$(cat $FILENAME)
for LINE in $LINES
do
 draw_progress_bar $COUNTER
 apt-get download "$LINE"
 COUNTER=$((COUNTER+1))
done

sleep 3
########
draw_progress_bar 90
rm qt4.list
rm libqt4.list
cd ..
sleep 3

draw_progress_bar 100
echo "

 -- Fichiers Téléchargés avec succès dans le dossier QT4

    Terminé

"
sleep 1
destroy_scroll_area
exit 1
}

main() {
    # Make sure that the progress bar is cleaned up when user presses ctrl+c
    enable_trapping
    # Create progress bar
    setup_scroll_area
    for i in {1..100}
    do
    #fonction du script a inserer ici
      script
      draw_progress_bar $i
    done
    destroy_scroll_area
}

start
