default:
  @just --list --unsorted

set positional-arguments

c side:
    qmk compile -kb svalboard/trackball/pmw3389/{{side}} -km tht78

cp:
    cp .build/*.uf2 /mnt/c/Users/thomas/Documents/Svalboard

f side:
    qmk flash -kb svalboard/trackball/pmw3389/{{side}} -km tht78

m:
    #!/usr/bin/env sh
    echo "Attempting to mount keyboard..."
    DEVICE=$(ls /dev/disk/by-id/usb-RPI_RP2*-part1 2>/dev/null | head -n1)
    if [ -n "$DEVICE" ]; then
        udisksctl mount -b "$DEVICE" && echo "Keyboard mounted successfully"
    else
        echo "Error: Keyboard device not found. Is it in bootloader mode?"
        exit 1
    fi

gac message:
    git add .
    git commit -m "{{message}}"
