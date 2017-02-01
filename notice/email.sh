#!/bin/bash

# Скрипт отправки e-mail уведомлений
# Автор:  Олег Букатчук
# Версия: 1.9
# e-mail: oleg@bukatchuk.com

# Настройки почты

# Поле "Кому"
export MAILTO=login@target.com

# Поле "От кого"
export FROM=my@server.com

# Тема письма (1-й параметр к скрипту)
export NAME=$1

# Тело письма (2-й параметр к скрипту)
export BODY=$2

# Отправляем письма через почтовый сервер smtp.domain.com
export SMTP_SERVER=smtp.domain.com

# Логин
export SMTP_LOGIN=login@domain.com

# Пароль
export SMTP_PASS=password

# Отправляем письмо
/usr/bin/sendEmail -f $FROM -t $MAILTO -u $NAME -m $BODY -s $SMTP_SERVER \
                   -o message-charset=utf-8 -o tls=no $MAILTO -xu $SMTP_LOGIN -xp $SMTP_PASS
