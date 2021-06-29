CREATE USER 'aspire_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON aspire.* TO 'aspire_user'@'localhost';
FLUSH PRIVILEGES;