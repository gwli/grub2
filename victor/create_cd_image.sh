#!/bin/sh
echo Creating bootable CD image...

GRUB_INSTALL=`pwd`/../../grub_install

#mkdir -p bin
#mkdir -p boot
#cp grub.cfg.debug.example boot/grub.cfg
#cp /boot/vmlinuz-$(uname -r) bin/kernel

$GRUB_INSTALL/bin/grub-mkimage --format=i386-pc --prefix="(cd)" --directory=$GRUB_INSTALL/lib/grub/i386-pc --output=bin/core.img \
      --config="boot/grub.cfg" loadenv biosdisk part_msdos part_gpt fat ntfs \
      ext2 ntfscomp iso9660 loopback search linux boot minicmd cat cpuid chain \
      halt help ls reboot echo test configfile normal sleep memdisk tar font \
      gfxterm gettext true vbe vga video_bochs video_cirrus multiboot multiboot2
cat $GRUB_INSTALL/lib/grub/i386-pc/cdboot.img bin/core.img > bin/grub.img
genisoimage -graft-points -input-charset utf8 -A "grub2" -quiet -R -b \
      boot/grub/grub.img -no-emul-boot -boot-load-size 4 -boot-info-table \
      -o bootcd.iso \
      boot/kernel=bin/kernel \
      boot/grub/grub.cfg=boot/grub.cfg \
      boot/grub/grub.img=bin/grub.img
