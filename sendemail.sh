#!/bin/bash

# Скрипт отправки e-mail уведомлений
# Автор:  Олег Букатчук
# Версия: 0.1
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

# Выясняем статус пакета sendemail в системе.
SENDEMAIL_OK=$(dpkg-query -W --showformat='${Status}\n' sendemail|grep "install ok installed")

if [ "" == "$SENDEMAIL_OK" ]; 
then
    # Ставим пакет sendemail.
    sudo apt-get --force-yes --yes install sendemail
fi

# Отправляем письмо
/usr/bin/sendEmail -f $FROM -t $MAILTO -o message-charset=utf-8 -u $NAME -m $BODY -s $SMTPSERVER -o tls=yes -xu $SMTPLOGIN -xp $SMTPPASS
