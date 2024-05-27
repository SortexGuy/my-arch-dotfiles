sudo pacman -S --needed base-devel git &&
git clone https://aur.archlinux.org/yay.git ~/yay && cd ~/yay && makepkg -si &&

yay -S stow --noconfirm --sudoloop
