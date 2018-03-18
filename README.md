![Plen.co](https://plen.co/assets/images/logo.png)

## Monitor de Servicio / Service Monitor

### Configuración
1. Copiar el siguiente contenido en un archivo bash `check_services.sh`
2. Modificar el contenido de las variables `SERVICE` `MAILBOX` `FILELOG` `HOSTNAME`
3. Crear un CRON cada 5' o el tiempo que desean:
`*/5 * * * * bash /root/check_services.sh> /dev/null`

### Archivo BASH
```
#!/bin/bash
SERVICE=nombre-del-servicio
MAILBOX=miemail@dominio.com
FILELOG=/root/content_mail.log
HOSTNAME=hostname-del-servidor

if [ "`systemctl is-active $SERVICE`" != "active" ] 
then 
    touch $FILELOG
    echo "$SERVICE no está ejecutandose, intento reiniciar" >> $FILELOG
    systemctl restart $SERVICE >> $FILELOG
    echo "$SERVICE estado actual" >> $FILELOG
    systemctl status $SERVICE >> $FILELOG
    mail -s "[$HOSTNAME] $SERVICE Report" $MAILBOX < $FILELOG
    rm -f $FILELOG
    exit 0
fi 
exit 0
```
***
[Plen.co](https://plen.co)
