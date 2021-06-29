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