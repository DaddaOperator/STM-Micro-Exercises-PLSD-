# PLSD Project Source Code
Source code of the Random Number Generator project.
* The "LoRaWAN_End_Node" folder contains the code of the STM32WL55JC microcontroller
* The "RandomNumberClient.py" is the client script

## Installation
Install the project with git
```bash
git clone -b final-project https://github.com/DaddaOperator/STM-Micro-Exercises_PLSD.git
```

### Import
Open STM32CubeIDE and click on "File" -> "Import.."

![Import1](https://raw.githubusercontent.com/DaddaOperator/STM-Micro-Exercises_PLSD/final-project/readme_media/import1.png)

Then, click on "Existing Projects into Workspace"

![Import2](https://raw.githubusercontent.com/DaddaOperator/STM-Micro-Exercises_PLSD/final-project/readme_media/import2.png)

Then, click on "Browse" and select the "STM32CubeIDE" folder inside "LoRaWAN_End_Node"

![Import3](https://raw.githubusercontent.com/DaddaOperator/STM-Micro-Exercises_PLSD/final-project/readme_media/import3.png)

Click "Finish"

### Run the Client
Make sure you have python3 downloaded on your machine and install mqtt paho library using pip
```bash
pip install paho-mqtt
```
Run the client script
```bash
python RandomNumberClient.py
```


## Authors

- [Davide Reverberi](https://www.github.com/DaddaOperator)
- [Alessandro Galloni](https://www.github.com/gallons29)
