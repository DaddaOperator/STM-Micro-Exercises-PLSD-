################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Application/User/Drivers/drv_lsm6dso.c 

OBJS += \
./Application/User/Drivers/drv_lsm6dso.o 

C_DEPS += \
./Application/User/Drivers/drv_lsm6dso.d 


# Each subdirectory must supply rules for building sources it contributes
Application/User/Drivers/%.o Application/User/Drivers/%.su Application/User/Drivers/%.cyclo: ../Application/User/Drivers/%.c Application/User/Drivers/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DCORE_CM4 -DUSE_HAL_DRIVER -DSTM32WL55xx -c -I../../Core/Inc -I"C:/Users/alega/STM32CubeIDE/workspace/LoRaWAN_End_Node/Drivers/BSP/Components" -I"C:/Users/alega/STM32CubeIDE/workspace_1.13.2/LoRaWAN_End_Node/Drivers/BSP/Components/lsm6dso" -I"C:/Users/alega/STM32CubeIDE/workspace_1.13.2/LoRaWAN_End_Node/STM32CubeIDE/Application/User/Drivers" -I../../LoRaWAN/App -I../../LoRaWAN/Target -I../../Drivers/STM32WLxx_HAL_Driver/Inc -I../../Drivers/STM32WLxx_HAL_Driver/Inc/Legacy -I../../Utilities/trace/adv_trace -I../../Utilities/misc -I../../Utilities/sequencer -I../../Utilities/timer -I../../Utilities/lpm/tiny_lpm -I../../Middlewares/Third_Party/LoRaWAN/LmHandler/Packages -I../../Drivers/CMSIS/Device/ST/STM32WLxx/Include -I../../Middlewares/Third_Party/LoRaWAN/Crypto -I../../Middlewares/Third_Party/LoRaWAN/Mac/Region -I../../Middlewares/Third_Party/LoRaWAN/Mac -I../../Middlewares/Third_Party/LoRaWAN/LmHandler -I../../Middlewares/Third_Party/LoRaWAN/Utilities -I../../Middlewares/Third_Party/SubGHz_Phy -I../../Middlewares/Third_Party/SubGHz_Phy/stm32_radio_driver -I../../Drivers/CMSIS/Include -I../../Drivers/BSP/STM32WLxx_Nucleo -I../../X-CUBE-MEMS1/Target -I"C:/Users/Utente/STM32CubeIDE/workspace_1.13.2/LoRaWAN_End_Node/STM32CubeIDE/Application/User/Drivers" -I../../Drivers/BSP/Components/lsm6dso16is -Og -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@"

clean: clean-Application-2f-User-2f-Drivers

clean-Application-2f-User-2f-Drivers:
	-$(RM) ./Application/User/Drivers/drv_lsm6dso.cyclo ./Application/User/Drivers/drv_lsm6dso.d ./Application/User/Drivers/drv_lsm6dso.o ./Application/User/Drivers/drv_lsm6dso.su

.PHONY: clean-Application-2f-User-2f-Drivers

