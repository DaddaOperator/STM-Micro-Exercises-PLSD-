#Random Number Generator code
#Devo ancora trovare i png dei dati delle dimensioni corrette quindi non li ho ancora messi su Github

import pygame
from sys import exit

pygame.init()
pygame.display.set_caption('RandomNumberGenerator')
test_font = pygame.font.Font('Media/Pixeltype.ttf', 50)

CFG_PASSWORD = "NNSXS.6L22CCFQSRSDWUSLIGPMVM7WM3LAQLVBBKPOOEQ.QWTLGKHJJYVHAWYL67BO5TOA3XEBHNVMDMVMBR22BD2GEZQJSAXA"

# Set up the drawing window
clock = pygame.time.Clock()
screen = pygame.display.set_mode((800,400))
text_surface = test_font.render("Random Number Generator", False, 'Red')

#Things on the screen
dice_1_surface = pygame.image.load('Media/Dice_2.png')

while True:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            pygame.quit()
            exit()

    screen.fill((255, 255, 255))
    screen.blit(text_surface, (200,50))
    screen.blit(dice_1_surface, (100,250))  
    
    pygame.display.update()
    clock.tick(60)

pygame.quit()