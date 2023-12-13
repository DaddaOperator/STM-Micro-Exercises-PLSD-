################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (11.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
../STM32CubeIDE/Application/Startup/startup_stm32wl55jcix.s 

OBJS += \
./STM32CubeIDE/Application/Startup/startup_stm32wl55jcix.o 

S_DEPS += \
./STM32CubeIDE/Application/Startup/startup_stm32wl55jcix.d 


# Each subdirectory must supply rules for building sources it contributes
STM32CubeIDE/Application/Startup/%.o: ../STM32CubeIDE/Application/Startup/%.s STM32CubeIDE/Application/Startup/subdir.mk
	arm-none-eabi-gcc -mcpu=cortex-m4 -g3 -DDEBUG -c -x assembler-with-cpp -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfloat-abi=soft -mthumb -o "$@" "$<"

clean: clean-STM32CubeIDE-2f-Application-2f-Startup

clean-STM32CubeIDE-2f-Application-2f-Startup:
	-$(RM) ./STM32CubeIDE/Application/Startup/startup_stm32wl55jcix.d ./STM32CubeIDE/Application/Startup/startup_stm32wl55jcix.o

.PHONY: clean-STM32CubeIDE-2f-Application-2f-Startup

