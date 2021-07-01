-- Create
CREATE DATABASE IF NOT EXISTS `aspire` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create user 
CREATE USER IF NOT EXISTS 'aspire_user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON aspire.* TO 'aspire_user'@'%';
FLUSH PRIVILEGES;