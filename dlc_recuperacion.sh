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
                f_Recuperar_debian
                ;;
            2)
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
                ;;
            3)
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

