#!/bin/bash

# Скрипт отправки e-mail уведомлений
# Автор:  Олег Букатчук
# Версия: 0.5
# e-mail: oleg@bukatchuk.com

# Подключаем файл c настройками DB Suite
source "../db_suite.sh"

# Отправляем письмо
/usr/bin/sendEmail -f $FROM -t $MAILTO -u $NAME -m $BODY -s $SMTP_SERVER \
                   -o message-charset=utf-8 -o tls=no $MAILTO -xu $SMTP_LOGIN -xp $SMTP_PASS
