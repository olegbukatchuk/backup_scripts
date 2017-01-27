#!/bin/bash

# Скрипт отправки сообщений в Telegram
# Автор:  Олег Букатчук
# Версия: 0.2
# e-mail: oleg@bukatchuk.com

# Определяем переменную для аккаунта.
# Замените 'account_name' на имя вашего Telegram аккаунта
to=account_name

# 
function show_usage {
  echo "Usage $0 [message]"
  exit
}

# 
if [ $# -lt 1 ]
  then
    show_usage
fi

# Отправляем сообщение
telegram-cli -W -e "msg $to $1"
