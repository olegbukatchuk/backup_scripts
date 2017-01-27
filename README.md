# DB Suite v.1.6 [![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](http://www.gnu.org/licenses/gpl-3.0)
Скрипты для управления и резервного копирования MySQL/PostgreSQL 

### Возможности скриптов
- Создание дампов баз данных (по расписанию). 
- Ротация бекапов (поиск и удаление старых дампов).
- Отправка e-mail уведомлений (через SMTP-сервер).

### В разработке
- Установка и настройка сервера MySQL.
- Установка и настройка сервера PostgreSQL.

## Установка
Клонируем репозиторий:
```markdown
git clone https://github.com/olegbukatchuk/db_suite
```
Делаем скрипт исполняемым:
```markdown
sudo chmod +x /path/to/db_suite/mysql_backup.sh
```
Выставляем права доступа на директорию хранения бекапов:
```markdown
sudo chmod -R 777 /path/to/backup/mysql
```
и прописываем значения переменных и констант для корректного выполнения процедуры снятия дампов. 

### MySQL 5.x
Определяем переменные и константы для соединения с базой данных MySQL в файле mysql.sh

```markdown
# Объявляем переменные для авторизации в MySQL.
export HOST_MYSQL=host
export USER_MYSQL=login
export PASS_MYSQL=password
export DB_MYSQL=database

# Создаём константу из абсолютного пути к скрипту.
export RUN_ME=/path/to/db_suite/mysql_backup.sh

# Создаём константу для директории хранения бекапов.
export STORAGE=/path/to/backup/mysql
```

### PostgreSQL 9.x
Определяем переменные и константы для соединения с базой данных PostgreSQL в файле postgresql.sh

```markdown
# Создаём константу для подключеня к базе данных.
export CONNECT_DB=postgresql://password:login@host:5432/database

# Создаём константу из абсолютного пути к скрипту.
export RUN_ME=/path/to/db_suite/postgresql_backup.sh

# Создаём константу для директории хранения бекапов.
export STORAGE=/path/to/backup/dir
```
### Пример работы скрипта
```markdown
user@host:~$ /path/to/db_suite/mysql_backup.sh 
Проверка наличия директории для хранения бекапов...
OK
Идёт создание дампа БД...
Загружено:  623MiB 0:00:20 [30.5MiB/s] [                        <=>                                ]
OK
Идёт поиск и удаление старых дампов БД...
ОК
Проверка наличия задания в Cron'e...
0 1 * * * /path/to/db_suite/mysql_backup.sh
OK
```
Все скрипты умеют работать, как с локальным, так и с сетевым сокетом, поэтому задание можно запускать не только на сервере, где находиться база данных, но и на удалённом хосте.

Не забудьте при необходимости повторения процедуры поставить задание в планировщик у себя на сервере.

### 
Ставим скрипт на выполнение (из консоли) в 1 час 00 минут после полуночи ежедневно:

```markdown
crontab -e

# Добавляем в конец файла наше задание

0 1 * * * /path/to/db_suite/mysql_backup.sh
```
Сохраняем и перезапускаем Cron:

```markdown
sudo service cron restart
```
ВАЖНО! Для того, чтобы оправлялись e-mail уведомления о выполнении скрипта убедитесь, что в системе стоит утилита sendemail. Установить её можно с помощью данной команды:

```markdown
sudo apt-get install sendemail
```

Готово!

## Поддержка и контакты

Есть вопрос или предложение? Свяжитесь со мной любым удобным вам способом из представленных у меня на сайте [bukatchuk.com](https://bukatchuk.com/contacts/).
