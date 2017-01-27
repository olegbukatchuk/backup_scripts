#!/bin/bash

# Скрипт отправки e-mail уведомлений
# Автор:  Олег Букатчук
# Версия: 0.3
# e-mail: oleg@bukatchuk.com

# Поле "Кому"
MAILTO=login@target.com

# Поле "От кого"
FROM=my@server.com

# Тема письма (1-й параметр к скрипту)
NAME=$1

# Тело письма (2-й параметр к скрипту)
BODY=$2

# Отправляем письма через почтовый ящик на domain.com 
# Скрипт легко адаптируется для любых почтовых серверов
SMTPSERVER=smtp.domain.com

# Логин и пароль
SMTPLOGIN=login@domain.com
SMTPPASS=password

# Отправляем письмо
/usr/bin/sendEmail -f $FROM -t $MAILTO -u $NAME -m $BODY -s $SMTPSERVER -o tls=no $MAILTO -o message-charset=utf-8 -xu $SMTPLOGIN -xp $SMTPPASS
