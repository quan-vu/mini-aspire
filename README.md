# MiniAspire

MiniAspire is a digital banking which provide loans for businesses.

## Features

MiniAspire Backend API provide the restful api with two scope are admin and clients as follows:

Admin API: /admin/

Client API: /v1/

### Admin API definition

**Roles**

- Manage admin roles and account for Administrator, Employee, Manager

**Users**

- Can create, read, update, delete users.
- Can not delete a use who has more than one loans is approved.

**Loans**

- Can see the loan request of users.
- Can create the loans package for a user.
- Can approve the loans.

### Client API definition

**User**

- Can register an account.
- Can login, logout system.
- Can get user's profile.
- Can list all of their loans.
- Can pay for repayment of their loans.

### Busines Logic

Loan business logic

- When admin create a loan it also create repayment schedule for that loan.

Payment Transactions

- When a user make a success payment for repayment via bank account, paypal the repayment must be mark as paid.
- Return message "Repayment is paid already" if a repayment is paid.

## TODO

- [x] User can register an account.
- [x] User can login, logout system. 
- [x] User can get user's profile.
- [x] User can list all of their loans.
- [x] User can pay for repayment of their loans (Faked, need integrating by real payment transaction).
- [x] Admin (Employee, Manager) can create a loan and repayment schedule for a user.
- [x] Admin can list, search, view details of all loans.
- [ ] Admin can aprove a loand of user (not implement yet). 
- [ ] Support payment methods such as Bank Account, Visa/master card, Paypal (not implement yet).

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

Useful composer commands

```shell
# Composer dump
make composer-dump

# Install a package
make composer-require name=<package_name>
```

## Testing

Start the testing environment

```shell
# Step 1: Initialize fresh test environment
make test-init

# Step 2: Run the testing
make test
```

Useful test commands

```shell
# Run all test 
make test

# Run test feature only
make test-unit

# Run test unit only
make test-unit

# Run test for one class only
make test-filter name=UserTest
```

## Production

For the first time, deploy application to production we need to passport generate access tokens.

```shell
# Use Makefile
make generate-key

# Run in laravel docker container
php artisan passport:keys
```

## Note

> This project is in progress not ready for production yet.
