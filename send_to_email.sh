#!/bin/bash

# Скрипт отправки e-mail уведомлений
# Автор:  Олег Букатчук
# Версия: 0.4
# e-mail: oleg@bukatchuk.com

# Подключаем файл c настройками DB Suite
. ./db_suite.conf

# Отправляем письмо
/usr/bin/sendEmail -f $FROM -t $MAILTO -u $NAME -m $BODY -s $SMTPSERVER -o tls=no $MAILTO -o message-charset=utf-8 -xu $SMTPLOGIN -xp $SMTPPASS
