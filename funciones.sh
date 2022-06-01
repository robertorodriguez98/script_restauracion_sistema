#! /usr/bin/env bash

function NO {
    Wh2=1
    while [ $Wh2 -eq 1 ]; do
        Wh2=0
        read -p "Quieres reiniciar el equipo? [S/n]: " Pr2
        case $Pr2 in
        S | s)
            echo "Reiniciando..."
            sleep 1
            reboot
            ;;
        N | n)
            Wh6=1
            ;;
        *)
            echo "Argumento invalido"
            sleep 1
            Wh2=1
            ;;
        esac
    done
}


function f_Recuperar_debian {
Wh1=1
while [ $Wh1 -eq 1 ]; do
    Wh1=0
    echo "Estas a punto de recuperar el sistemas debian 11"
    read -p "¿Quieres recuperar el sistema? [S/n]: " Pr1
    case $Pr1 in
    S | s)
        Wh3=1
        while [ $Wh3 -eq 1 ]; do
            Wh3=0
            read -p "Estas seguro? [S/n]: " Pr3
            case $Pr3 in
            S | s)
                partclone.ext4 -r -d -s /home/particion/debian_raiz.img -o /dev/sda5
partclone.ext4 -r -d -s /home/particion/debian_var.img -o /dev/sda7
                echo "Recuperacion completada"
                reboot
                ;;
            N | n)
                NO
                ;;
            *)
                echo "Argumento invalido"
                sleep 1
                Wh3=1
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
        Wh1=1
        ;;
    esac
done
}