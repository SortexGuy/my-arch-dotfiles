function installed_pkgs -d "List installed packages with size"
    # set packages (pacman -Qq)
    # set expac_out (expac "%n:-------------------> %m" -l'\n\n' -H 'M' -Q $packages \
    #         | sort -rhk 2)
    # command bat $sorted
    expac "%n:-------------------> %m" -l'\n' \
        -H 'M' -Q $(pacman -Qq) | sort -rhk 2 | bat
end
