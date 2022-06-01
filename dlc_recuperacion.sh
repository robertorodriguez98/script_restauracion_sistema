#!/bin/bash

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
            echo ""
            read -p "> " Pr5
            case $Pr5 in
            1)
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
				partclone.ext4 -r -d -s /home/particion/debian_var.img -o /dev/sda
                                echo "Recuperacion completada"
                                read -p "¿Quieres limpiar la partición /home? [S/n]" Pr4
                                case $Pr4 in
                                S | s)
                                    echo "Limpiando particion /home"
                                    sleep 1
                                    rm -r /home/usuario/*/*
                                    echo "Particion /home limpia"
                                    sleep 1
                                    ;;
                                N | n)
                                    NO
                                    ;;
                                esac
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

