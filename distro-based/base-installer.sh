#!/bin/bash

ln -sf /usr/share/zoneinfo/America/Bogota /etc/localtime
hwclock --systohc
# Enable en_US and es_CO (UTF-8) locales
# TODO: Replace two lines with one replacement
sed -i '177s/^#//' /etc/locale.gen
sed -i '191s/^#//' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=la-latin1" >> /etc/vconsole.conf
echo "hostname.domain" >> /etc/hostname
echo "127.0.0.1 localhost" >> /etc/hosts
echo "::1       localhost" >> /etc/hosts
echo "127.0.1.1 hostname.domain hostname.localdomain hostname" >> /etc/hosts
echo root:password | chpasswd

echo "FONT=ter-v12n" >> /etc/vconsole.conf

pacman -S grub efibootmgr networkmanager network-manager-applet dialog wpa_supplicant mtools dosfstools base-devel linux-headers avahi xdg-user-dirs xdg-utils gvfs gvfs-smb nfs-utils inetutils dnsutils bluez bluez-utils hplip alsa-utils pulseaudio pipewire pipewire-alsa pipewire-jack bash-completion openssh rsync reflector acpi acpi_call tlp dnsmasq iptables-nft ipset firewalld sof-firmware nss-mdns acpid os-prober ntfs-3g terminus-font --needed

grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd
systemctl enable avahi-daemon
systemctl enable tlp # You can comment this command out if you didn't install tlp, see above
systemctl enable reflector.timer
systemctl enable firewalld
systemctl enable acpid

useradd -m geektimus
echo geektimus:password | chpasswd

echo "geektimus ALL=(ALL) ALL" >> /etc/sudoers.d/geektimus

printf "\e[1;32mDone! Type exit, umount -a and reboot.\e[0m"
