#!/bin/bash

# DB Suite роутер
# Автор:  Олег Букатчук
# Версия: 1.9
# e-mail: oleg@bukatchuk.com

# Подключаем конфиг
source "./config.sh"

# Тип БД (1-й параметр к скрипту)
export DB_TYPE=$1

# Действие с БД (2-й параметр к скрипту)
export ACTION_TYPE=$2

# Зеленый цвет
export SETCOLOR_SUCCESS="echo -en \\033[1;32m"

# Красный цвет
export SETCOLOR_FAILURE="echo -en \\033[1;31m"

# Цвет по умолчанию
export SETCOLOR_NORMAL="echo -en \\033[0;39m"

#####################################################################################################################
# Проверка аргументов перед запуском скриптов

# $#	переменная, содержащая количество аргументов, преданных скрипту.
# -eq 2	проверяем, равняется ли количество переданных аргументов двум.
# $0	возвращает путь к shell скрипту.
if [ $# -eq 2 ];
    then
        echo "Укажите параметры запуска: $0 условие1 условие2";
        exit 1;
    else
        # Команда, которую нужно отследить
        # printf 'Введите параметры запуска:'

        # Читаем ввод из консоли
        # read INPUT

        # Ловим параметры и запускаем соответствующий параметрам скрипт
        case `$0 ${DB_TYPE} ${ACTION_TYPE}` in
            "$0 mysql backup")
                sudo ${DB_SUITE}/mysql/mysql_backup.sh
                ;;
            "$0 mysql tunning")
                sudo ${DB_SUITE}/mysql/mysql_tunning.sh
                ;;
            "$0 postgresql backup")
                sudo ${DB_SUITE}/postgresql/postgresql_backup.sh
                ;;
            "$0 postgresql tunning")
                sudo ${DB_SUITE}/postgresql/postgresql_tunning.sh
                ;;
            *)
                echo "Не верно заданы параметры запуска."
                ;;
        esac
fi

#####################################################################################################################
# Цветной вывод результата выполнения скриптов

if [ $? -eq 0 ];
    then
        ${SETCOLOR_SUCCESS}
        echo -n "$(tput hpa $(tput cols))$(tput cub 6)[OK]"
        echo -n "Путь к скрипту: $0"
        ${SETCOLOR_NORMAL}
        echo
    else
        ${SETCOLOR_FAILURE}
        echo -n "$(tput hpa $(tput cols))$(tput cub 6)[fail]"
        echo -n "Путь к скрипту: $0"
        ${SETCOLOR_NORMAL}
        echo
fi
