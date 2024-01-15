#Random Number Generator code
#Devo ancora trovare i png dei dati delle dimensioni corrette quindi non li ho ancora messi su Github

import pygame
from sys import exit
import paho.mqtt.client as mqtt
import json
import base64

# configs, to be changed according to your application / device settings  --> DA MODIFICARE TRANNE PASSWORD

CFG_SERVER_HOST         = "eu1.cloud.thethings.network"
CFG_SERVER_PORT         = 1883
CFG_SERVER_CON_TIMEOUT  = 20

CFG_USERNAME            = "rev-gallo-application@ttn"
CFG_PASSWORD            = "NNSXS.Y4CLEBLT4SAWZC4RUG3T7EFLLZSNV4QUSVELJWQ.USKKSQXCGDURLNC53DPMALINWGJR5ZOW3XM6B4R2OCRSHKVEWYSA"

CFG_APP_ID              = "rev-gallo-application"
CFG_APP_ID_AT_TTN       = CFG_APP_ID + "@ttn"
CFG_DEVICE_ID           = "eui-70b3d57ed00634c0"

roll_state = False #Quando Vero si può inclinare la scheda per scegliere numero di dati e comunicazione downlink
dice_quantity = 1;
result = 0;

def on_connect(client, userdata, flags, rc): 
    """
    The callback for on-connect event.
    """
    print("Connected with result code " +str(rc))

    # on successful connection (rc = 0), subscribe on "interesting" topics
    if (rc == 0):
        topic = "v3/" + CFG_APP_ID_AT_TTN + "/devices/" + CFG_DEVICE_ID + "/join"
        print("Subscribing to \n\t" + topic)
        client.subscribe(topic, 0)
        
        topic = "v3/" + CFG_APP_ID_AT_TTN + "/devices/" + CFG_DEVICE_ID + "/up"
        print("Subscribing to \n\t" + topic)
        client.subscribe(topic, 0)
        
        topic = "v3/" + CFG_APP_ID_AT_TTN + "/devices/" + CFG_DEVICE_ID + "/down/#"
        print("Subscribing to \n\t" + topic)
        client.subscribe(topic, 0)

# message_cnt = 0
def on_message(client, userdata, msg):    #DA MODIFICARE
    """
    The callback for when a PUBLISH message is received from the server.
    """
    # global message_cnt
    # global message_uplink
    
    # message_cnt += 1
    
    # print("\r\n\r\n---> message #" + str(message_cnt))
    print("topic: \r\n\t" + str(msg.topic))
    print("payload:\r\n\t" + str(msg.payload))
    print("----")
    
    if msg.topic.endswith('up'):
        # message_uplink += 1
        
        payload = json.loads(msg.payload.decode('utf8'))
        print("\r\npayload bytes (base64): " + payload['uplink_message']['frm_payload'])
        
        # convert the payload message to an array of bytes
        base64_bytes = payload['uplink_message']['frm_payload'].encode('ascii')
        message_bytes = base64.b64decode(base64_bytes)
        print("\r\npayload bytes (base64): " + message_bytes.hex('-'))
        
        # parsing examples..
        acc_x = (((((message_bytes[1] << 24) | message_bytes[2] << 16) | message_bytes[3] << 8) | message_bytes[4]) & 0xFFFFFFFF)
        acc_y = (((((message_bytes[5] << 24) | message_bytes[6] << 16) | message_bytes[7] << 8) | message_bytes[8]) & 0xFFFFFFFF)
        gyr_y = (((((message_bytes[9] << 24) | message_bytes[10] << 16) | message_bytes[11] << 8) | message_bytes[12] ) & 0xFFFFFFFF)        
        if acc_x & 0x80000000:
            acc_x = acc_x - 0x100000000
        if acc_y & 0x80000000:
            acc_y = acc_y - 0x100000000
        if gyr_y & 0x80000000:
            gyr_y = gyr_y - 0x100000000
        

        print("ax, ay, gy:" + str(acc_x) + " --- " + str(acc_y) + " --- " + str(gyr_y))

        # print("\r\nTemperature: " + str(message_bytes[3]) + " °C")
        # print("Pressure: " + str(( (message_bytes[1] << 8) + message_bytes[2] ) / 10 ) + " hPa")
        # print("Humidity: " + str(( (message_bytes[4] << 8) + message_bytes[5] ) / 10 ) + " %")

        # if 

        print("----")
    else:
        pass

#   Creating the client    
client = mqtt.Client("RandomNumberProject@ttn")
client.on_connect = on_connect
client.on_message = on_message

#   Connect to broker
client.username_pw_set(CFG_USERNAME, CFG_PASSWORD)
client.connect(CFG_SERVER_HOST, CFG_SERVER_PORT, CFG_SERVER_CON_TIMEOUT)
client.loop_start()

#   Graphic Logic
pygame.init()
pygame.display.set_caption('Random Number Generator')
basicTest_font = pygame.font.Font('./Media/Pixeltype.ttf', 35)
titleTest_font = pygame.font.Font('./Media/Pixeltype.ttf', 50)

# Set up the window
clock = pygame.time.Clock()
screen = pygame.display.set_mode((800,600))
text_surface = titleTest_font.render("Random Number Generator", False, 'DeepSkyBlue3')
text_description1 = basicTest_font.render("Tilt the board left and right to add or change the number of dice to roll", False, 'Black')
text_description2 = basicTest_font.render("Shake the board upward to confirm and roll the dice", False, 'Black')

text_button = basicTest_font.render("Change  mode", False, 'Black')
changeState_button = pygame.Rect(310, 480, 180, 65) 

#Things on the screen
#dice_1_surface = pygame.image.load('Media/Dice_2.png').convert_alpha()

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            exit()

        if event.type == pygame.KEYDOWN and event.key == pygame.K_SPACE:
            roll_state = not roll_state

        if event.type == pygame.MOUSEBUTTONDOWN:
            if changeState_button.collidepoint(pygame.mouse.get_pos()):
                roll_state = not roll_state

        #if event.type == pygame.MOUSEMOTION:
            #print(event.pos)

    screen.fill((255, 255, 255))
    screen.blit(text_surface, (200,50))

    pygame.draw.rect(screen, 'SkyBlue1', changeState_button)
    screen.blit(text_button, (330,504 ))

    if roll_state :
        screen.blit(text_description2, (20,130))  
        #implement the downlink communication --> Sending 0 to the micro

    else:
        screen.blit(text_description1, (20,130))  
        #implement the downlink communication --> Sending 1 to the micro
    
    pygame.display.update()
    clock.tick(60)

pygame.quit()