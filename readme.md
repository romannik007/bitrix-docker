1. build.sh  - (запускать 1 раз если все нормально без ошибок на экране) для установки  «1С-Битрикс: Веб-окружение» - Linux (BitrixEnv) - стандартный скрипт со страницы https://www.1c-bitrix.ru/download/vmbitrix.php
2. commit.sh - для создания образа из контейнера с установленной средой (впоследствии из него запускаем новый контейнер с пробросом нужных папок)
3. Запуск **docker-compose up -d --build bitrix** - запуск только первый раз, далее уже запускаем **docker-compose start bitrix** (вэбка доступна по порту 80 или 443, mysql - 3306 (пароль admin))
4. Кидаем bitrixsetup.php в bitrix/www переходим по http:/127.0.0.1/bitrixsetup.php

**docker exec -ti bitrix /bin/bash** - подключиться к контенеру в баш )
5. Сервер для соединения с mysql при установке **mysql**

**Примечание:**
- работает всё
- bitix_env.sh 7.5
- параметры установки меняем в в файле build.sh
- по умолчанию ставится percona mysql 5.7 (можно изменить в Dockerfile и в build.sh)
- папки сайта - в bitrix/www
- дополнительно устанавливается mc 

**Недостатки:**
- всё в одном, что противоречит концепции docker
- создаваемые файлы в контейнере, не доступны для редактирования на хосте LInux(помогает смена прав), на windows редактированеи доступно


