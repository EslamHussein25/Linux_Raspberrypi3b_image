cmd_arch/arm/boot/dts/overlays/ssd1351-spi.dtbo := mkdir -p arch/arm/boot/dts/overlays/ ; arm-linux-gnueabi-gcc -E -Wp,-MD,arch/arm/boot/dts/overlays/.ssd1351-spi.dtbo.d.pre.tmp -nostdinc -I./scripts/dtc/include-prefixes -undef -D__DTS__ -x assembler-with-cpp -o arch/arm/boot/dts/overlays/.ssd1351-spi.dtbo.dts.tmp arch/arm/boot/dts/overlays/ssd1351-spi-overlay.dts ; ./scripts/dtc/dtc -@ -H epapr -O dtb -o arch/arm/boot/dts/overlays/ssd1351-spi.dtbo -b 0 -i arch/arm/boot/dts/overlays/ -Wno-unit_address_vs_reg -Wno-unit_address_format -Wno-gpios_property -Wno-avoid_unnecessary_addr_size -Wno-alias_paths -Wno-graph_child_address -Wno-simple_bus_reg -Wno-unique_unit_address -Wno-pci_device_reg  -Wno-interrupts_property -d arch/arm/boot/dts/overlays/.ssd1351-spi.dtbo.d.dtc.tmp arch/arm/boot/dts/overlays/.ssd1351-spi.dtbo.dts.tmp ; cat arch/arm/boot/dts/overlays/.ssd1351-spi.dtbo.d.pre.tmp arch/arm/boot/dts/overlays/.ssd1351-spi.dtbo.d.dtc.tmp > arch/arm/boot/dts/overlays/.ssd1351-spi.dtbo.d

source_arch/arm/boot/dts/overlays/ssd1351-spi.dtbo := arch/arm/boot/dts/overlays/ssd1351-spi-overlay.dts

deps_arch/arm/boot/dts/overlays/ssd1351-spi.dtbo := \

arch/arm/boot/dts/overlays/ssd1351-spi.dtbo: $(deps_arch/arm/boot/dts/overlays/ssd1351-spi.dtbo)

$(deps_arch/arm/boot/dts/overlays/ssd1351-spi.dtbo):
