/*
 * drv_hts221.h
 *
 *  Created on: Nov 22, 2023
 *
 */

#ifndef APPLICATION_USER_DRIVERS_DRV_HTS221_H_
#define APPLICATION_USER_DRIVERS_DRV_HTS221_H_

/* Prototypes -----------------------------------------------------------*/
void HTS221_USER_Init(void);
float HTS221_Read_Temperature(void);
float HTS221_Read_Humidity(void);


#endif /* APPLICATION_USER_DRIVERS_DRV_HTS221_H_ */

