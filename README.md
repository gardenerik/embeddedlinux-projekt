# Raspberry Pi VNC client

## Ako vybuildovať

Treba spustiť `build.sh`.

Výsledný image sa objaví v `buildroot/output/images/sdcard.img`.

## Čo to robí

- Po nabootovaní sa pripojí k WiFi uvedenej pri buildovaní.
- Spustí sa X server.
- Spustí sa RDP klient, ktorý sa pripojí k zvolenému RDP serveru.

## Ako sme sa sem dostali

- V buildroote som najprv rozbehal WiFi kombináciou RPI WiFi firmvéru a iwd.
  Init automaticky pri boote načíta `brcmfmac` modul a spustí iwd, ktoré sa
  postará o pripojenie k WiFi a získanie DHCP leasu.
- Potom som rozbehal xorg server, v podstate nainštalovaním framebuffer driveru
  (xf86-video-fbdev), a načítaním tohto driveru v konfigurácií xorgu.
- Na pripojenie sa k RDP používam freerdp, ktorý init spustí po spustení xorgu.
- Na rozbehanie vstupu (klávesnica/myš) v xorgu som potreboval aktivovať (e)udev,
  a po doinštalovaní libinput-u a xf86-input-libinput som dosiahol funkčnosť
  vstupu v xku.
  
