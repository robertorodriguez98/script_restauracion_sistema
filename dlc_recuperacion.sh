#! /usr/bin/env bash
source /home/funciones.sh

Wh6=1
while [ $Wh6 -eq 1 ]; do
    Wh6=0
    read -p "Quieres recuperar el sistema? [S/n]: " Pr6
    case $Pr6 in
    S | s)
        Wh5=1
        while [ $Wh5 -eq 1 ]; do
            Wh5=0
            echo "Que sistema quieres recuperar?"
            echo ""
            echo "<1> Debian 11"
            echo "<2> Windows 10"
            echo "Adicionalmente puedes limpiar la partición /home de debian:"
            echo "<3> Limpiar /home"
            echo ""
            read -p "> " Pr5
            case $Pr5 in
            1)
                f_recuperar_debian
                ;;
            2)
                f_recuperar_windows
                ;;
            3)
                f_limpiar_home
                ;;
            *)
                echo "Argumento invalido"
                sleep 1
                Wh5=1
                ;;
            esac
        done
        ;;
    N | n)
        NO
        ;;
    *)
        echo "Argumento invalido"
        sleep 1
        Wh6=1
        ;;
    esac
done

