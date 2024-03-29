# Проектная работа 7

1. Создать ВМ в Я.Облаке (минимальная конфигурация: 2vCPU, 2GB RAM, 20GB HDD).
2. Установить и запустить на ВМ Docker.
3. Установить и запустить на ВМ СУБД Postgres.
4. В Postgres создать БД и пользователя с произвольным именем на ваш выбор и дать этому пользователю полные права на созданную БД.
5.  Создать Docker-образ:

- Содержащий Python 3, а также библиотеки для него: Flask, Psycopg2 (для работы с СУБД Postgres, хранящей данные) и ConfigParser.
- Содержащий код приложения на Python (копирующий его с локальной файловой системы). На хостовой ФС код будет лежать по пути: /srv/app/web.py.
- Содержащий конфигурационный файл приложения (копирующий его с локальной ФС). На хостовой ФС конфигурационный файл будет лежать по пути: /srv/app/conf/web.conf.
- При запуске контейнера, он должен запускать описанный выше код.
- Образ должен быть оптимизирован с учетом лучших практик.

Пришлите ментору свой Dockerfile, скриншот с работающим приложением и размер образа.
Для проверки работоспособности образа можно использовать приложение из репозитория (не забудьте поправить конфиг-файл).

Для этого потребуется склонировать репозиторий из GitHub (заодно вспомним, как работать с Git), создать директорию /srv/app/conf и расположить файлы из склонированного репозитория так:

- web.py расположить в /srv/app/;
- web.conf расположить в /srv/app/conf/.

Затем запустить Docker-контейнер, смонтировав /srv/app с хостовой ФС в контейнерную, а также пробросив порт 80 из контейнера в хостовую сеть.

`docker build . -t flaskapp-img`

`docker run -d --name flaskapp-app -p 80:5000 flaskapp-img`
