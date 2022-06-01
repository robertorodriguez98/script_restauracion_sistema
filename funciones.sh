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


function f_recuperar_debian {
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

function f_recuperar_windows {
Wh7=1
while [ $Wh7 -eq 1 ]; do
    Wh7=0
    echo "Estas a punto de recuperar el sistema Windows 10"
    read -p "Quieres recuperar el sistema? [S/n]: " Pr7
    case $Pr7 in
    S | s)
        Wh8=1
        while [ $Wh8 -eq 1 ]; do
            Wh8=0
            read -p "Estas seguro? [S/n]: " Pr8
            case $Pr8 in
            S | s)
                partclone.ext4 -r -d -s /home/particion/sda3_Windows.img -o /dev/sda3
                reboot
                ;;
            N | n)
                NO
                ;;
            *)
                echo "Argumento invalido"
                sleep 1
                Wh8=1
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
        Wh7=1
        ;;
    esac
done
}

function f_limpiar_home {
Wh9=1
while [ $Wh9 -eq 1 ]; do
    Wh9=0
    echo "Estas a punto de limpiar la particion /home"
    read -p "¿Quieres limpiar la particion /home? [S/n]: " Pr9
    case $Pr9 in
    S | s)
        Wh10=1
        while [ $Wh10 -eq 1 ]; do
            Wh10=0
            read -p "Estas seguro? [S/n]: " Pr10
            case $Pr10 in
            S | s)
                echo "Limpiando particion /home"
                sleep 1
                mount /dev/sda6 /mnt
                find /mnt/* -maxdepth 1 -type d | egrep -v "/mnt/(usuario|lost+found)" | xargs rm -rfd
                rm -r /mnt/usuario/*/*
                find /mnt/usuario/* -maxdepth 1 -type d | egrep -v "/mnt/usuario/(Descargas|Documentos|Imágenes|Escritorio|Música|Plantillas|Público|Vídeos)" | xargs rm -rf
                rm -rdf /mnt/usuario/.*
                echo "" > /mnt/usuario/.bash_history
                echo "Particion /home limpia"
                sleep 1
                ;;
            N | n)
                NO
                ;;
            *)
                echo "Argumento invalido"
                sleep 1
                Wh10=1
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
        Wh9=1
        ;;
    esac
done
}