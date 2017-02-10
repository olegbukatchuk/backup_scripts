#!/bin/bash

# Первый параметр (аккаунт)
DESTINATION=$1;

# Второй пареметр (сообщение)
MESSAGE=$2;

#
(sleep 3; echo "msg ${DESTINATION} ${MESSAGE}"; echo "safe_quit") \
              | bin/telegram-cli -k tg-server.pub -W
