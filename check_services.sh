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
