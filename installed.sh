expac "%n %m" -l'\n' -Q $(pacman -Qq) | sort -rhk 2 | less
