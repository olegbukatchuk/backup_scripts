#!/bin/bash

# Скрипт установки и настройки сервера MySQL
# Автор:  Олег Букатчук
# Версия: 0.9
# e-mail: oleg@bukatchuk.com

# Подключаем файл c настройками DB Suite
. ../db_suite.conf

# Информируем пользователя
echo "Идёт проверка зависимостей скрипта..."

# Проверяем наличие утилиты pv, если нет ставим её.
if [ "" == "$PV_OK" ];
then
    # Ставим пакет pv (для отрисовки прогресс-бара).
    echo "Установка зависимостей скрипта..."
    sudo apt-get --force-yes --yes install pv
fi

if [ "" == "$SENDEMAIL_OK" ];
then
    # Ставим пакет sendemail.
    sudo apt-get --force-yes --yes install sendemail
fi

# Информируем пользователя
echo "OK"

if [ "" == "$TELEGRAM_CLI_OK" ];
then
    # Ставим пакеты libjansson4, telegram-cli.
    sudo apt-get --force-yes --yes install libjansson4
    sudo dpkg -i $PACKAGE/telegram-cli_1.0.6-1_amd64.deb
fi

# Информируем пользователя
echo "Проверка конфигурации..."

# Проверяем наличие эталонных файлов, если файлов нет
# выводим сообщение в консоль и останавливаем выполнение скрипта.
if [ ! -d $DEFAULT_MYSQL ];
    then
        # Информируем пользователя
        echo "В системе нет эталонных конфигурационных файлов!"\n
        echo "$DEFAULT_MYSQL"
        # Остановка скрипта
        exit 1
    else
        # Информируем пользователя
        echo "OK"
fi

# Проверяем наличие конфигурационных файлов, если файлов нет
# выводим сообщение в консоль и останавливаем выполнение скрипта.
if [ ! -d $LOCAL_MYSQL ];
    then
        # Информируем пользователя
        echo "Идёт установка MySQL..."
        # Установка PostgreSQL
        sudo apt-get update && sudo apt-get --force-yes --yes install mysql-server-5.5
    else
        # Копирование конфигурации
        sudo cp $DEFAULT_MYSQL $LOCAL_MYSQL
fi

# Информируем пользователя
echo "Применение эталонной конфигурации сервера..."

# Перезагужаем сервер для применения новой конфигурации
sudo service mysql restart

# Информируем пользователя
echo "OK"

# Выводим статус сервера
sudo service mysql status

echo "Настройка сервера MySQL выполнена успешно!"

# Информируем пользователя
echo "Отправка отчёта на e-mail и в Telegram..."

# Отправляем письмо и push-уведомление в Telegram с указанием имени сервера
# на котором выполнился скрипт, датой, размером директории бекапов.
. $NOTICE/email.sh "Настройка $SERVER_NAME: сервер MySQL установлен!" "$SPACE_USED"
. $NOTICE/telegram.sh "Настройка $SERVER_NAME: сервер MySQL установлен!" "$SPACE_USED"

# Информируем пользователя
echo "OK"

# Возвращаем общий результат, иначе возвращается результат выполнения последней команды.
exit 0
