# Minimal Raspberrypi3b image

This the minimal boot file system built from scratch 

## steps 
1. build u-boot
2. build kernel
3. build rootfilesystem
  
> ## u-boot stage 

First of all need to install dependencies for u-boot 
 
```
sudo apt -y install gcc-arm-linux-gnueabihf binutils-arm-linux-gnueabihf
sudo apt-get -y install bison flex bc libssl-dev make gcc 
```

then go through download source code 

`
git clone https://github.com/u-boot/u-boot.git
`
then got through directory 

` cd u-boot
`

go to configs file and check the version you have and apply the default for example in my case for raspberry pi3-b 

```
make rpi_3_32b_defconfig ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

```

Adjust your settings through menuconfig 
---

```
make menuconfig ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
```

Then run make to build the binary 
---

```
make -j 6 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

```

---
---
> ## Kernel stage 
```
git clone --depth=1 https://github.com/raspberrypi/linux
cd linux

```

Apply default config for RPi3
```
  make bcm2709_defconfig ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
  or
  make bcm2835_defconfig ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

  
```
Compile actual kernel, modules, DTBs
Takes ~20 minutes on modern i7 with SSD
```

make -j12 zImage modules dtbs ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-

```


May require `sudo`:
```
export INSTALL_MOD_PATH=/home/moatasem/linux/
make modules_install ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf-
```

copy to sdacard

```

cp arch/arm/boot/zImage /media/moatasem/rpi_boot
cp arch/arm/boot/dts/bcm2710-rpi-3-b.dtb /media/moatasem/rpi_boot
cp arch/arm/boot/dts/overlays/disable-bt.dtbo /media/moatasem/rpi_boot/overlays

```
