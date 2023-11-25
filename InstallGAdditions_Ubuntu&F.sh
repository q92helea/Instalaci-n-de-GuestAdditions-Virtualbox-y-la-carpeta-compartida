#!/bin/bash
# Script:InstalarGAdditions.sh
# Autor:	Andrés Heras
# Fecha:	24/11/2023
# Descripción:Instala las GuestAdditions de Virtualbox y crea un carpeta compartida, llamada "compartida" en Ubuntu y derivados. 
# Antes de ejecutar el script comprobar que el sistema sobre el en que se va a ejecutar el script tiene le directorio /mnt.
# No olvidar configurar la carpeta "compartida" en el sistema anfitrión a través de la interfaz gráfica del Virtualbox.

# Actualiza la información local de lista de paquetes del sistema anfitrión
sudo apt update
# Instala la actualizaciones disponible para los paquetes instalados en el sistema
sudo apt upgrade -y

# Instalar paquetes necesarios para la instalación de Guest Additions
sudo apt install -y gcc make perl build-essential dkms linux-headers-$(uname -r)

# Creación de la carpeta "compartida"
sudo mkdir /mnt/compartida

# Montar la imagen de Guest Additions
sudo mount /dev/sr0 /mnt/compartida

# Ejecutar el script de instalación de Guest Additions
sudo sh /mnt/compartida/VBoxLinuxAdditions.run

# Desmontar la imagen de Guest Additions
sudo umount /dev/sr0

# Configurar carpeta compartida y añadir al archivo /etc/fstab
echo "Compartida /mnt/compartida vboxsf defaults 0 0" | sudo tee -a /etc/fstab

# Reiniciar la máquina virtual para aplicar los cambios
sudo reboot




