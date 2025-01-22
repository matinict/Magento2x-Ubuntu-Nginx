
    #!/bin/bash
    #Blackarch os Update in single cli
    # Update package database first
    sudo pacman -Syy

    # Get the full package list
    pkg_list=$(pacman -Qq)
    total_pkgs=$(echo "$pkg_list" | wc -l)

    # Loop through packages in batches of 100
    for i in $(seq 0 100 $total_pkgs); do
        batch=$(echo "$pkg_list" | sed -n "$((i+1)),$((i+100))p")
        if [[ -n "$batch" ]]; then
            sudo pacman -Syu --overwrite='*' --noconfirm --needed $batch
        fi
    done
