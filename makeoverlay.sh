#!/bin/sh

read -p "WiFi SSID: " ssid
read -p "WiFi password: " password

mkdir -p overlay/var/lib/iwd

echo "[Security]" > overlay/var/lib/iwd/$ssid.psk
echo "Passphrase=$password" >> overlay/var/lib/iwd/$ssid.psk


read -p "RDP server IP: " ip

echo "#!/bin/sh

case \"\$1\" in
        start)
                DISPLAY=:0 xfreerdp /v:$ip /cert:ignore
                ;;
        stop|restart|reload)
        		echo \"Smolka kámo\"
        		;;
        *)
                echo \"Usage: \$0 {start|stop|restart|reload}\"
                exit 1
                ;;
esac" > overlay/etc/init.d/S90xfreerdp

echo "sudo: chown overlay files"
sudo chmod +x overlay/etc/init.d/S90xfreerdp
sudo chown -R root:root overlay/
