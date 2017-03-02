#!/bin/bash

# Все настройки скриптов
# Автор:  Олег Букатчук
# Версия: 1.9
# e-mail: oleg@bukatchuk.com

# Создаём константу из абсолютного пути к директории скриптов и выставляем правильные права доступа.
export DB_SUITE="/path/to/db_suite"

# Создаём константу из абсолютного пути к директории со скриптами для уведомлений.
export EMAIL="${DB_SUITE}/action"

# Создаём константу из смонтированной ftp-директории.
export FTP_MOUNT_DIR="/mnt/ftp"

# Создаём константу из ftp-коннекта.
export FTP_STORAGE="/path/to/ftp/dir"

# Создаём константу с обозначением имени сервера
export SERVER_NAME=hostname

# Создаём константу из абсолютного пути к скрипту и делаем скрипт исполняемым.
export RUN_MYSQL_BACKUP="${DB_SUITE}/mysql/mysql_backup.sh"

# Создаём константу из абсолютного пути к скрипту и делаем скрипт исполняемым.
export RUN_POSTGRESQL_BACKUP="${DB_SUITE}/postgresql/postgresql_backup.sh"

# Создаём константу для директории хранения бекапов.
export STORAGE="/path/to/backup/postgresql"

# Создаём константу для размера директории с бэкапами.
export SPACE_USED=`du -sh ${STORAGE}`

# Создаём константу для директории эталонной конфигурации MySQL.
export DEFAULT_MYSQL="${DB_SUITE}/config/mysql/my.cnf"

# Создаём константу для директории эталонной конфигурации PostgreSQL.
export DEFAULT_POSTGRESQL="${DB_SUITE}/config/postgresql/postgresql.conf"

# Создаём константу для директории пакетов.
export PACKAGE="${DB_SUITE}/package"

# Создаём константу для директории хранения конфигов сервера MySQL.
export LOCAL_MYSQL="/etc/mysql/my.cfg"

# Создаём константу для директории хранения конфигов сервера PostgreSQL.
export LOCAL_POSTGRESQL="/etc/postgresql/9.6/main/postgresql.conf"

# Выясняем статус пакета MySQL в системе и создаём константу.
export MYSQL_OK=$(dpkg-query -W --showformat='${Status}\n' mysql | grep "install ok installed")

# Выясняем статус пакета PostgreSQL в системе и создаём константу.
export POSGRESQL_OK=$(dpkg-query -W --showformat='${Status}\n' postgresql | grep "install ok installed")
s
# Выясняем статус пакета pv в системе и создаём константу.
export PV_OK=$(dpkg-query -W --showformat='${Status}\n' pv | grep "install ok installed")

# Выясняем статус пакета sendemail в системе и создаём константу.
export SENDEMAIL_OK=$(dpkg-query -W --showformat='${Status}\n' sendemail | grep "install ok installed")

#####################################################################################################################
# Настройки MySQL

# Объявляем переменные для авторизации в MySQL
# export HOST_MYSQL=localhost
# export USER_MYSQL=login
# export PASS_MYSQL=password
# export DB_MYSQL=database

#####################################################################################################################
# Настройки PostgreSQL

# Создаём константу для подключеня к базе данных PostgeSQL.
# export CONNECT_POSTGRESQL=postgresql://password:login@127.0.0.1:5432/database

#####################################################################################################################
# Настройки режима отладки

# Режим отладки скрипта (любое действие можно отслеживать: любая команда >> $LOG_FILE)
# export LOG_DIR=/var/log/db_suite && sudo mkdir $LOG_DIR
# export LOG_FILE="${LOG_DIR}/postgresql_backup.log" && sudo touch "${LOG_DIR}/${LOG_FILE}"

# Выставляем пользователя под которым будут запускаться скрипты.
sudo chown -R user:user ${DB_SUITE}

# Выставляем права доступа на директорию со скриптами.
sudo chmod -R 777 ${DB_SUITE}

# Делаем скрипты для MySQL исполняемыми.
sudo chmod +x ${RUN_MYSQL_BACKUP}

# Делаем скрипты для PostgreSQL исполняемыми.
sudo chmod +x ${RUN_POSTGRESQL_BACKUP}

# Подключаем файл
source "${DB_SUITE}/mysql/mysql_backup.sh"

# Подключаем файл
source "${DB_SUITE}/mysql/mysql_tunning.sh"

# Подключаем файл
source "${DB_SUITE}/postgresql/postgresql_backup.sh"

# Подключаем файл
source "${DB_SUITE}/postgresql/postgresql_tunning.sh"

# Подключаем файл
source "${DB_SUITE}/notice/email.sh"
