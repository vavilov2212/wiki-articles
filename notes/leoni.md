# Leoni
Инструкция по запуску dev сборки
Перед началом работы желательно установить(если его нет) nginx-proxy
```Shell
docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro --network="server" --name="nginx_proxy" --restart="unless-stopped" jwilder/nginx-proxy
```
Не забываем .env файл (пример .env.dist)

Для успешного первого запуска необходимо:
```Shell
docker-compose up -d
docker exec -it leoni_app_1 bash 
// Execute an interactive bash shell on the container.
composer install
php artisan storage:link
// The public disk is intended for files that are going to be publicly accessible. 
// Creates symbolic link from public/storage to storage/app/public
php artisan migrate:fresh --seed --force
npm install
npm run watch
```
Для дальнейших запусков (если останавливали контейнер) нужно только docker-compose up -d

