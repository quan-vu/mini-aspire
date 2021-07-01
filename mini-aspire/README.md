# MiniAspire

## Development

Start fresh project

```shell
# Step 1: Build and run application with Docker
# Waiting for docker container are ready
make start

# Step 2: Migrate and seed fresh database
make refresh

# Step 3: Init some required parts
make init

# Step 4: Check application is ready
# You will see a test like: PONG
make verify
```

## Testing

Start the testing environment

```shell
# Step 1: Initialize fresh test environment
make test-init

# Step 2: Run the testing
make test
```

## Production

For the first time, deploy application to production we need to passport generate access tokens.

```shell
# Use Makefile
make generate-key

# Run in laravel docker container
php artisan passport:keys
```