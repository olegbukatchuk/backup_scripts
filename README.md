## Скрипты для резервного копирования баз данных

Набор скриптов для создания дампов баз данных в СУБД: MySQL 5.x/6.x, PostgreSQL 9.x.

Всё, что вам нужно сделать - это скопировать скрипт на сервер и определить значения переменных и констант для корректного выполнения процедуры снятия дампов. Не забудьте поставить задание в планировщик у себя на сервере. 

Все скрипты умеют работать, как с локальным, так и с сетевым сокетом, поэтому задание можно запускать не только на сервере, где находиться база данных, но и на удалённом хосте.

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

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### PostgreSQL

Определение констант и переменных для соединения с базой данных MySQL 5.x/6.x

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Поддержка и контакты

Есть вопрос или предложение? Свяжитесь со мной любым удобным вам способом из представленных у меня на сайте [bukatchuk.com](https://bukatchuk.com/contacts/).
