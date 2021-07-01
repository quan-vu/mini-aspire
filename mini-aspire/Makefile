dir=${CURDIR}
export COMPOSE_PROJECT_NAME=mini-aspire
export PROJECT_ROOT=./mini-aspire
export LARAVEL_APP=laravel

exec:
	docker-compose exec ${LARAVEL_APP} $$cmd

setup:
	php artisan passport:install

build:
	docker-compose build

start:
	docker-compose up -d

stop:
	docker-compose down

clean:
	docker-compose down -v

generate-key:
	@php artisan key:generate --ansi

migrate:
	docker-compose exec ${LARAVEL_APP} php artisan migrate

migration:
	docker-compose exec ${LARAVEL_APP} php artisan make:migration $$name

rollback:
	docker-compose exec ${LARAVEL_APP} php artisan migrate:rollback

seed-db:
	docker-compose exec ${LARAVEL_APP} php artisan db:seed

seed-class:
	docker-compose exec ${LARAVEL_APP} php artisan db:seed --class=$$name

composer-install:
	docker-compose exec ${LARAVEL_APP} composer install

composer-dump:
	docker-compose exec ${LARAVEL_APP} composer dump-autoload

composer-require:
	docker-compose exec ${LARAVEL_APP} composer require $$name