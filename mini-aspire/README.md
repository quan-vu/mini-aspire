# MiniAspire

## Development

To start project run these command:

```shell
# Step 1: Build and run application with Docker
make start

# Step 2: Migrate database
make migrate

# Step 3: Install passport
make exec cmd="php artisan passport:install"
```

## Production

For the first time, deploy application to production we need to passport generate access tokens.

```shell
# Use Makefile
make generate-key

# Run in laravel docker container
php artisan passport:keys
```