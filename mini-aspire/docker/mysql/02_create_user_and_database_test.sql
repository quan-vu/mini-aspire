-- Create
CREATE DATABASE IF NOT EXISTS `aspire_test` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create user 
CREATE USER IF NOT EXISTS 'aspire_user_test'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON aspire_test.* TO 'aspire_user_test'@'%';
FLUSH PRIVILEGES;