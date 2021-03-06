:: setup
del board*.xe
del app*.xe	
copy empty.xe boardA.xe
copy empty.xe boardB.xe
copy empty.xe boardC.xe
copy empty.xe boardD.xe
copy empty.xe appA.xe
copy empty.xe appB.xe
copy empty.xe appC.xe
copy empty.xe appD.xe

:: compile the test program
xcc quad.xn test.xc -o quad.xe

:: split real executable
xobjdump --split "quad.xe"

:: create new executables
xobjdump boardA.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump boardA.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump boardA.xe -a 0,0,image_n0c0.elf
xobjdump boardA.xe -a 0,1,image_n0c1.elf
xobjdump boardA.xe -a 0,2,image_n0c2.elf
xobjdump boardA.xe -a 0,3,image_n0c3.elf
xobjdump boardB.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump boardB.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump boardB.xe -a 0,0,image_n1c0.elf
xobjdump boardB.xe -a 0,1,image_n1c1.elf
xobjdump boardB.xe -a 0,2,image_n1c2.elf
xobjdump boardB.xe -a 0,3,image_n1c3.elf
xobjdump boardC.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump boardC.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump boardC.xe -a 0,0,image_n2c0.elf
xobjdump boardC.xe -a 0,1,image_n2c1.elf
xobjdump boardC.xe -a 0,2,image_n2c2.elf
xobjdump boardC.xe -a 0,3,image_n2c3.elf
xobjdump boardD.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump boardD.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump boardD.xe -a 0,0,image_n3c0.elf
xobjdump boardD.xe -a 0,1,image_n3c1.elf
xobjdump boardD.xe -a 0,2,image_n3c2.elf
xobjdump boardD.xe -a 0,3,image_n3c3.elf
xobjdump appA.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump appA.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump appA.xe -a 0,image_n0c0_2.elf
xobjdump appA.xe -a 1,image_n0c1_2.elf
xobjdump appA.xe -a 2,image_n0c2_2.elf
xobjdump appA.xe -a 3,image_n0c3_2.elf
xobjdump appB.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump appB.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump appB.xe -a 0,image_n1c0_2.elf
xobjdump appB.xe -a 1,image_n1c1_2.elf
xobjdump appB.xe -a 2,image_n1c2_2.elf
xobjdump appB.xe -a 3,image_n1c3_2.elf
xobjdump appC.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump appC.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump appC.xe -a 0,image_n2c0_2.elf
xobjdump appC.xe -a 1,image_n2c1_2.elf
xobjdump appC.xe -a 2,image_n2c2_2.elf
xobjdump appC.xe -a 3,image_n2c3_2.elf
xobjdump appD.xe -a "%XCC_DEVICE_PATH%/config_XS1-G4B-FB512.xml"
xobjdump appD.xe -a "%XCC_DEVICE_PATH%/XS1-G4B-FB512.xn"
xobjdump appD.xe -a 0,image_n3c0_2.elf
xobjdump appD.xe -a 1,image_n3c1_2.elf
xobjdump appD.xe -a 2,image_n3c2_2.elf
xobjdump appD.xe -a 3,image_n3c3_2.elf

:: clean up
del program_info.txt
del platform_def.xn
del *.elf
del config.xml

