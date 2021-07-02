dir=${CURDIR}
export COMPOSE_PROJECT_NAME=mini-aspire
export PROJECT_ROOT=./mini-aspire
export LARAVEL_APP=laravel

exec:
	docker-compose exec ${LARAVEL_APP} $$cmd

build:
	docker-compose build

start:
	docker-compose up -d

stop:
	docker-compose down

clean:
	docker-compose down -v

migrate:
	docker-compose exec ${LARAVEL_APP} php artisan migrate

migrate-test:
	docker-compose exec ${LARAVEL_APP} php artisan migrate --env=testing

migration:
	docker-compose exec ${LARAVEL_APP} php artisan make:migration $$name

refresh:
	docker-compose exec ${LARAVEL_APP} php artisan migrate:refresh --seed

rollback:
	docker-compose exec ${LARAVEL_APP} php artisan migrate:rollback

seed-db:
	docker-compose exec ${LARAVEL_APP} php artisan db:seed

seed-class:
	docker-compose exec ${LARAVEL_APP} php artisan db:seed --class=$$name

init:
	docker-compose exec ${LARAVEL_APP} php artisan key:generate
	docker-compose exec ${LARAVEL_APP} php artisan passport:install

verify:
	curl --location --request GET 'http://localhost:8001/'

composer-install:
	docker-compose exec ${LARAVEL_APP} composer install

composer-dump:
	docker-compose exec ${LARAVEL_APP} composer dump-autoload

composer-require:
	docker-compose exec ${LARAVEL_APP} composer require $$name

test-init:
	docker-compose exec ${LARAVEL_APP} php artisan migrate:refresh --seed --env=testing
	docker-compose exec ${LARAVEL_APP} php artisan passport:install --env=testing

test: 
	docker-compose exec ${LARAVEL_APP} php artisan config:clear --env=testing
	docker-compose exec ${LARAVEL_APP} php artisan test --stop-on-failure

test-feature: 
	docker-compose exec ${LARAVEL_APP} php artisan config:clear --env=testing
	docker-compose exec ${LARAVEL_APP} php artisan test --testsuite=Feature --stop-on-failure

test-unit: 
	docker-compose exec ${LARAVEL_APP} php artisan config:clear --env=testing
	docker-compose exec ${LARAVEL_APP} php artisan test --testsuite=Unit --stop-on-failure

test-class:
	docker-compose exec ${LARAVEL_APP} php artisan config:clear --env=testing
	docker-compose exec ${LARAVEL_APP} php artisan test --filter=$$name
