## Важно!

Набор скриптов для создания дампов баз данных в СУБД: MySQL 5.x/6.x, PostgreSQL 9.x. Всё, что вам нужно сделать - это скопировать скрипт на сервер, затем сделать скрипт исполняемым:
```markdown
sudo chmod +x /path/to/script/backup_mysql.sh
```
далее выставить права доступа на директорию хранения бекапов:
```markdown
sudo chmod -R 777 /path/to/backup/mysql
```
и определить значения переменных и констант для корректного выполнения процедуры снятия дампов. 

Все скрипты умеют работать, как с локальным, так и с сетевым сокетом, поэтому задание можно запускать не только на сервере, где находиться база данных, но и на удалённом хосте.

### MySQL
Определение констант и переменных для соединения с базой данных MySQL 5.x/6.x

```markdown
# Объявляем переменные для авторизации в MySQL.
export HOST_MYSQL=some_localhost
export USER_MYSQL=some_login
export PASS_MYSQL=some_password
export DB_MYSQL=some_database

# Создаём константу из абсолютного пути к скрипту.
export RUN_ME=/path/to/script/backup_mysql.sh

# Создаём константу для директории хранения бекапов.
export STORAGE=/path/to/backup/mysql
```

### PostgreSQL
Определение констант и переменных для соединения с базой данных PostgreSQL 9.x

```markdown
# Создаём константу для подключеня к базе данных.
export CONNECT_DB=postgresql://password:login@127.0.0.1:5432/database

# Создаём константу из абсолютного пути к скрипту.
export RUN_ME=/path/to/script/backup_postgresql.sh

# Создаём константу для директории хранения бекапов.
export STORAGE=/path/to/backup/dir
```
### Пример работы скрипта
```markdown
user@host:~$ /path/to/script/backup_mysql.sh 
Проверка наличия директории для хранения бекапов...
OK
Идёт создание дампа БД...
OK
Идёт поиск и удаление старых дампов БД...
ОК
Проверка наличия задания в Cron'e...
0 1 * * * /path/to/backup_mysql.sh
OK
```
Не забудьте при необходимости повторения процедуры поставить задание в планировщик у себя на сервере.

### 
Ставим скрипт на выполнение (из консоли) в 1 час 00 минут после полуночи ежедневно:

```markdown
crontab -e

# Добавляем в конец файла наше задание

0 1 * * * /path/to/scripts/backup_mysql.sh
```
Сохраняем и перезапускаем Cron:

```markdown
sudo service cron restart
```
# P.S.
### Синтаксис Cron'a
```markdown
# * * * * * "/команда/которая/будет/выполнена"
# - - - - -
# | | | | |
# | | | | ----- День недели (0 - 7) (Воскресенье=0 или 7, 0-Вс,1-Пн,2-Вт,3-Ср,4-Чт,5-Пт,6-Сб,7-Вс)
# | | | ------- Месяц (1 - 12)
# | | --------- Число (1 - 31)
# | ----------- Часы (0 - 23)
# ------------- Минуты (0 - 59)
```

Готово!

### Поддержка и контакты

Есть вопрос или предложение? Свяжитесь со мной любым удобным вам способом из представленных у меня на сайте [bukatchuk.com](https://bukatchuk.com/contacts/).
