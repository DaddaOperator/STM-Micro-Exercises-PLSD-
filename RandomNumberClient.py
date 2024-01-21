#Random Number Generator code
#Devo ancora trovare i png dei dati delle dimensioni corrette quindi non li ho ancora messi su Github

import pygame
from sys import exit
import paho.mqtt.client as mqtt
import json
import base64
from random import seed
from random import randint
seed(1)

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
dice_quantity = 1
dice_state = [] # Stato dei dadi usciti: es [6, 3, 1]
dice_generate = False # se True: lanciare funzione di generazione dei dadi; False: Non generare
result = 0

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

    global dice_generate
    # dice_generate = False
    global dice_quantity
    # dice_quantity = 1
    
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
        if roll_state == True:
            gyr_y = (((((message_bytes[1] << 24) | message_bytes[2] << 16) | message_bytes[3] << 8) | message_bytes[4] ) & 0xFFFFFFFF)        
            if gyr_y & 0x80000000:
                gyr_y = gyr_y - 0x100000000
            print("gy: " + str(gyr_y) + "dice_generate: ", dice_generate)
            if abs(gyr_y) > 40000:
                print("dentro gy")
                dice_generate = True
        
        else:
            acc_x = (((((message_bytes[1] << 24) | message_bytes[2] << 16) | message_bytes[3] << 8) | message_bytes[4]) & 0xFFFFFFFF)
            acc_y = (((((message_bytes[5] << 24) | message_bytes[6] << 16) | message_bytes[7] << 8) | message_bytes[8]) & 0xFFFFFFFF)
            if acc_x & 0x80000000:
                acc_x = acc_x - 0x100000000
            if acc_y & 0x80000000:
                acc_y = acc_y - 0x100000000
            print("ax, ay :" + str(acc_x) + " --- " + str(acc_y))
            if abs(acc_x) < 600:
                if acc_y > 700:
                    if dice_quantity < 6:
                        dice_quantity += 1
                        print("quantità dadi incementata. Attuale: ", dice_quantity)
                    else:
                        print("quantità massima. non è possibile incrementare")
                elif acc_y < -700:
                    if dice_quantity > 1:
                        dice_quantity -= 1
                        print("quantità dadi decrementata. Attuale: ", dice_quantity)
                    else:
                        print("quantità già al minimo. non è decrementata")
            else:
                print("modifica quantità fallita. raddrizza la scheda")
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

#   Font used in text
basicTest_font = pygame.font.Font('./Media/Pixeltype.ttf', 35)
titleTest_font = pygame.font.Font('./Media/Pixeltype.ttf', 50)
resultTest_font1 = pygame.font.Font('./Media/Pixeltype.ttf', 50)
resultTest_font2 = pygame.font.Font('./Media/Pixeltype.ttf', 65)

# Set up the window
clock = pygame.time.Clock()
screen = pygame.display.set_mode((800,600))
text_surface = titleTest_font.render("Random Number Generator", False, 'DeepSkyBlue3')
text_description1 = basicTest_font.render("Tilt the board left and right to add or change the number of dice to roll", False, 'Black')
text_description2 = basicTest_font.render("Shake the board to confirm and roll the dice", False, 'Black')

text_result = resultTest_font1.render("Result: ", False, 'Black')
text_button1 = basicTest_font.render("Change  mode", False, 'Black')
text_button2 = basicTest_font.render("Reset", False, 'Black')

changeState_button = pygame.Rect(310, 480, 180, 65) 
resetState_button = pygame.Rect(596, 334, 80, 30)

result_surface = resultTest_font2.render(str(result), False, 'DeepSkyBlue3')

#Import dice images
# dice_0_surface = pygame.image.load('Media/dice_0.png').convert_alpha()
# dice_1_surface = pygame.image.load('Media/dice_1.png').convert_alpha()
# dice_2_surface = pygame.image.load('Media/dice_2.png').convert_alpha()
# dice_3_surface = pygame.image.load('Media/dice_3.png').convert_alpha()
# dice_4_surface = pygame.image.load('Media/dice_4.png').convert_alpha()
# dice_5_surface = pygame.image.load('Media/dice_5.png').convert_alpha()
# dice_6_surface = pygame.image.load('Media/dice_6.png').convert_alpha()
dice_surfaces = []
for i in range(0, 7):
    dice_surfaces.append(pygame.image.load(f'Media/dice_{i}.png').convert_alpha())
    dice_surfaces[i] = pygame.transform.scale(dice_surfaces[i], (100, 100))

downlinks = {}
downlinks["downlinks"] = []
message_dnl = {"f_port": 2, "priority": "NORMAL"}
downlinks["downlinks"].append(message_dnl)
payload = bytearray(1)

# sincronizzazione payload
payload[0] = 0
downlinks["downlinks"][0]["frm_payload"] = base64.b64encode(payload).decode('utf8')
topic = "v3/" + CFG_APP_ID_AT_TTN + "/devices/" + CFG_DEVICE_ID + "/down/push"
client.publish(topic, json.dumps(downlinks))

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            exit()

        if event.type == pygame.MOUSEBUTTONDOWN:
            if changeState_button.collidepoint(pygame.mouse.get_pos()):
                roll_state = not roll_state

                if roll_state == False:
                    payload[0] = 0
                    downlinks["downlinks"][0]["frm_payload"] = base64.b64encode(payload).decode('utf8')
                else:
                    payload[0] = 1
                    downlinks["downlinks"][0]["frm_payload"] = base64.b64encode(payload).decode('utf8')
                print("\r\n" + str(downlinks) + "\r\n")

                topic = "v3/" + CFG_APP_ID_AT_TTN + "/devices/" + CFG_DEVICE_ID + "/down/push"
                client.publish(topic, json.dumps(downlinks))

            if resetState_button.collidepoint(pygame.mouse.get_pos()):
                dice_quantity = 1
                dice_state = []
                result = 0
                result_surface = resultTest_font2.render(str(result), False, 'DeepSkyBlue3')

       # if event.type == pygame.MOUSEMOTION:
          # print(event.pos)

    screen.fill((255, 255, 255))
    screen.blit(text_surface, (200,50))
    screen.blit(text_result, (589,240))
    screen.blit(result_surface, (624, 280))

    pygame.draw.rect(screen, 'SkyBlue1', changeState_button)
    screen.blit(text_button1, (330,504 ))

    pygame.draw.rect(screen, 'SkyBlue1', resetState_button)
    screen.blit(text_button2, (606,340))
    
    if roll_state :
        screen.blit(text_description2, (20,130))  
    else:
        screen.blit(text_description1, (20,130)) 

    #Dice generation
    if dice_generate == True:
        dice_state = [] # Reset dice state
        result = 0
        dice_generate = False
        for _ in range(0, dice_quantity):
            random_number = randint(1, 6)
            result = result + random_number
            result_surface = resultTest_font2.render(str(result), False, 'DeepSkyBlue3')
            dice_state.append(random_number)
            print("generato: ", dice_state)
            
    # Draw Dices
    # i = x + y*cols
    # x, y = i % cols, i // cols
    for i in range(0, dice_quantity):
        n_cols = 3
        dice_x = 40 + (i % n_cols)*170 # 40 = x di partenza + (100 + 70 = dimensione dado + spazio tra i dadi)
        dice_y = 200 + (i // n_cols)*120
        if dice_state == []:
            screen.blit(dice_surfaces[0], (dice_x, dice_y))
        else:
            screen.blit(dice_surfaces[dice_state[i]], (dice_x, dice_y))
    
    pygame.display.update()
    clock.tick(60)

pygame.quit()