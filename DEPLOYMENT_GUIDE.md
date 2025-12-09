# KUSSO System Deployment Guide - Ubuntu 24.04

Complete step-by-step guide to deploy the KUSSO Point of Sale system on Ubuntu 24.04 server.

---

## Table of Contents
1. [Server Prerequisites](#1-server-prerequisites)
2. [Initial Server Setup](#2-initial-server-setup)
3. [Install LAMP Stack](#3-install-lamp-stack)
4. [Configure MySQL Database](#4-configure-mysql-database)
5. [Deploy Application Files](#5-deploy-application-files)
6. [Configure Apache & Virtual Host](#6-configure-apache--virtual-host)
7. [SSL Certificate Setup](#7-ssl-certificate-setup)
8. [Configure Application](#8-configure-application)
9. [Set Permissions](#9-set-permissions)
10. [Testing & Verification](#10-testing--verification)
11. [Security Hardening](#11-security-hardening)
12. [Maintenance & Backup](#12-maintenance--backup)

---

## 1. Server Prerequisites

### Requirements
- Ubuntu 24.04 LTS server
- Minimum 2GB RAM
- 20GB disk space
- Root or sudo access
- Domain name (optional but recommended)
- Internet connection

### What You'll Install
- Apache 2.4
- PHP 8.3
- MySQL 8.0
- Git
- Certbot (for SSL)

---

## 2. Initial Server Setup

### Step 2.1: Update System
```bash
# Update package lists
sudo apt update

# Upgrade all packages
sudo apt upgrade -y

# Reboot if kernel was updated
sudo reboot
```

### Step 2.2: Create a Non-Root User (Optional but Recommended)
```bash
# Create new user
sudo adduser kusso

# Add to sudo group
sudo usermod -aG sudo kusso

# Switch to new user
su - kusso
```

### Step 2.3: Configure Firewall
```bash
# Install UFW if not installed
sudo apt install ufw -y

# Allow SSH
sudo ufw allow OpenSSH

# Allow HTTP
sudo ufw allow 'Apache'

# Allow HTTPS
sudo ufw allow 'Apache Secure'

# Enable firewall
sudo ufw enable

# Check status
sudo ufw status
```

---

## 3. Install LAMP Stack

### Step 3.1: Install Apache Web Server
```bash
# Install Apache
sudo apt install apache2 -y

# Start and enable Apache
sudo systemctl start apache2
sudo systemctl enable apache2

# Check Apache status
sudo systemctl status apache2

# Test: Open browser and visit http://YOUR_SERVER_IP
# You should see Apache2 Ubuntu Default Page
```

### Step 3.2: Install MySQL Server
```bash
# Install MySQL
sudo apt install mysql-server -y

# Start and enable MySQL
sudo systemctl start mysql
sudo systemctl enable mysql

# Check MySQL status
sudo systemctl status mysql
```

### Step 3.3: Secure MySQL Installation
```bash
# Run security script
sudo mysql_secure_installation

# Answer the prompts as follows:
# - VALIDATE PASSWORD COMPONENT? → Press N (No)
# - Set root password? → Press Y and enter a STRONG password
# - Remove anonymous users? → Press Y
# - Disallow root login remotely? → Press Y
# - Remove test database? → Press Y
# - Reload privilege tables? → Press Y
```

### Step 3.4: Install PHP 8.3
```bash
# Install PHP and required extensions
sudo apt install php libapache2-mod-php php-mysql php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y

# Verify PHP installation
php -v

# Expected output: PHP 8.3.x (cli) ...
```

### Step 3.5: Configure PHP
```bash
# Edit PHP configuration
sudo nano /etc/php/8.3/apache2/php.ini

# Find and modify these lines (use Ctrl+W to search):
upload_max_filesize = 20M
post_max_size = 20M
memory_limit = 256M
max_execution_time = 300
date.timezone = Asia/Manila

# Save and exit (Ctrl+X, then Y, then Enter)

# Restart Apache
sudo systemctl restart apache2
```

### Step 3.6: Test PHP
```bash
# Create a test PHP file
sudo nano /var/www/html/info.php

# Add this content:
<?php
phpinfo();
?>

# Save and exit
# Visit http://YOUR_SERVER_IP/info.php in browser
# You should see PHP info page

# Remove the test file after verification
sudo rm /var/www/html/info.php
```

---

## 4. Configure MySQL Database

### Step 4.1: Login to MySQL as Root
```bash
# Login to MySQL
sudo mysql -u root -p

# Enter the password you set during mysql_secure_installation
```

### Step 4.2: Create Database and Configure Root User
```sql
-- Create the kusso database
CREATE DATABASE kusso CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Configure root user to use native password (for PHP PDO compatibility)
ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'YOUR_ROOT_PASSWORD';

-- Flush privileges
FLUSH PRIVILEGES;

-- Verify the database was created
SHOW DATABASES;

-- Exit MySQL
EXIT;
```

**Important:** Replace `YOUR_ROOT_PASSWORD` with your actual MySQL root password.

### Step 4.3: Test Database Connection
```bash
# Test login with new authentication
mysql -u root -p

# Enter your password
# If successful, you'll see the MySQL prompt

# Exit
EXIT;
```

---

## 5. Deploy Application Files

### Step 5.1: Install Git
```bash
# Install Git
sudo apt install git -y

# Verify installation
git --version
```

### Step 5.2: Clone Repository
```bash
# Navigate to web root
cd /var/www/html

# Remove default Apache page
sudo rm index.html

# Clone your repository
sudo git clone https://github.com/sh3ki/kusso.git

# Move files from kusso folder to html root
sudo mv kusso/* .
sudo mv kusso/.gitignore .

# Remove empty kusso directory
sudo rmdir kusso
```

**Alternative Method - Manual Upload:**
If you prefer to upload files manually using SFTP/SCP:
```bash
# On your local machine (Windows PowerShell):
scp -r c:\Users\USER\Documents\SYSTEMS\WEB\PHP\VANILLA\kusso\* username@YOUR_SERVER_IP:/var/www/html/

# Or use FileZilla/WinSCP to upload files to /var/www/html/
```

### Step 5.3: Verify Files
```bash
# Check files are in place
ls -la /var/www/html/

# You should see index.php, includes/, pos/, etc.
```

---

## 6. Configure Apache & Virtual Host

### Step 6.1: Enable Required Apache Modules
```bash
# Enable mod_rewrite (for clean URLs)
sudo a2enmod rewrite

# Enable mod_headers (for security headers)
sudo a2enmod headers

# Enable mod_ssl (for HTTPS)
sudo a2enmod ssl

# Restart Apache
sudo systemctl restart apache2
```

### Step 6.2: Create Virtual Host Configuration
```bash
# Create new virtual host file
sudo nano /etc/apache2/sites-available/kusso.conf
```

**Add this configuration:**
```apache
<VirtualHost *:80>
    ServerName your-domain.com
    ServerAlias www.your-domain.com
    ServerAdmin admin@your-domain.com
    
    DocumentRoot /var/www/html
    
    <Directory /var/www/html>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    
    # Restrict access to sensitive directories
    <Directory /var/www/html/includes>
        Require all denied
    </Directory>
    
    <Directory /var/www/html/backups>
        Require all denied
    </Directory>
    
    # Log files
    ErrorLog ${APACHE_LOG_DIR}/kusso_error.log
    CustomLog ${APACHE_LOG_DIR}/kusso_access.log combined
    
    # Security headers
    Header always set X-Frame-Options "SAMEORIGIN"
    Header always set X-Content-Type-Options "nosniff"
    Header always set X-XSS-Protection "1; mode=block"
</VirtualHost>
```

**Note:** Replace `your-domain.com` with your actual domain name. If you don't have a domain, use your server IP address.

### Step 6.3: Enable the Virtual Host
```bash
# Disable default site
sudo a2dissite 000-default.conf

# Enable kusso site
sudo a2ensite kusso.conf

# Test Apache configuration
sudo apache2ctl configtest

# Should output: "Syntax OK"

# Restart Apache
sudo systemctl restart apache2
```

---

## 7. SSL Certificate Setup

### Step 7.1: Install Certbot (Let's Encrypt)
```bash
# Install Certbot
sudo apt install certbot python3-certbot-apache -y
```

### Step 7.2: Obtain SSL Certificate
**For domain name:**
```bash
# Run Certbot
sudo certbot --apache -d your-domain.com -d www.your-domain.com

# Follow the prompts:
# - Enter email address
# - Agree to terms (Y)
# - Share email with EFF (optional - Y or N)
# - Redirect HTTP to HTTPS? → Select 2 (Redirect)
```

**For IP address only (Self-Signed Certificate):**
```bash
# Generate self-signed certificate
sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/ssl/private/kusso-selfsigned.key \
  -out /etc/ssl/certs/kusso-selfsigned.crt

# Follow prompts and enter your server details

# Edit SSL virtual host
sudo nano /etc/apache2/sites-available/kusso-le-ssl.conf
```

Add:
```apache
<VirtualHost *:443>
    ServerName YOUR_SERVER_IP
    DocumentRoot /var/www/html
    
    SSLEngine on
    SSLCertificateFile /etc/ssl/certs/kusso-selfsigned.crt
    SSLCertificateKeyFile /etc/ssl/private/kusso-selfsigned.key
    
    <Directory /var/www/html>
        Options -Indexes +FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

```bash
# Enable SSL site
sudo a2ensite kusso-le-ssl.conf

# Restart Apache
sudo systemctl restart apache2
```

### Step 7.3: Auto-Renewal Setup (Let's Encrypt only)
```bash
# Test renewal
sudo certbot renew --dry-run

# Certbot automatically sets up a cron job for renewal
# Check it with:
sudo systemctl status certbot.timer
```

---

## 8. Configure Application

### Step 8.1: Create Configuration Files
```bash
# Navigate to includes directory
cd /var/www/html/includes

# Copy example config files
sudo cp config.example.php config.php
sudo cp paymongo_config.example.php paymongo_config.php
```

### Step 8.2: Configure Database Connection
```bash
# Edit config.php
sudo nano /var/www/html/includes/config.php
```

**Update with your database credentials:**
```php
<?php
$host = "localhost";
$db_name = "kusso";
$username = "root";
$password = "YOUR_MYSQL_ROOT_PASSWORD";

try {
    $conn = new PDO("mysql:host=$host;dbname=$db_name", $username, $password);
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Connection failed: " . $e->getMessage();
}
?>
```

**Important:** Replace `YOUR_MYSQL_ROOT_PASSWORD` with your actual MySQL root password.

### Step 8.3: Configure PayMongo API
```bash
# Edit paymongo_config.php
sudo nano /var/www/html/includes/paymongo_config.php
```

**Update with your PayMongo keys:**
```php
<?php
define('PAYMONGO_SECRET_KEY', 'sk_test_YOUR_ACTUAL_SECRET_KEY');
define('PAYMONGO_PUBLIC_KEY', 'pk_test_YOUR_ACTUAL_PUBLIC_KEY');
define('PAYMONGO_API_URL', 'https://api.paymongo.com/v1');
// ... rest of the file
?>
```

**To get your PayMongo keys:**
1. Go to https://dashboard.paymongo.com/
2. Login to your account
3. Navigate to Developers → API Keys
4. Copy your test keys and paste them in the config

### Step 8.4: Import Database Schema
```bash
# Import the SQL file
mysql -u root -p kusso < /var/www/html/kusso.sql

# Enter your MySQL root password when prompted

# Verify tables were created
mysql -u root -p kusso -e "SHOW TABLES;"
```

You should see tables like: users, products, orders, inventory, etc.

### Step 8.5: Create Admin User
```bash
# Login to MySQL
mysql -u root -p kusso
```

```sql
-- Create admin user
INSERT INTO users (username, password, role, email, full_name, created_at) 
VALUES ('admin', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 'admin@kusso.local', 'System Administrator', NOW());

-- The default password is: password
-- You MUST change this after first login!

-- Exit MySQL
EXIT;
```

---

## 9. Set Permissions

### Step 9.1: Set Ownership
```bash
# Set Apache as owner
sudo chown -R www-data:www-data /var/www/html

# Set your user as co-owner (optional, for easier file editing)
sudo usermod -aG www-data $USER
```

### Step 9.2: Set Directory Permissions
```bash
# Navigate to web root
cd /var/www/html

# Set proper permissions for directories
sudo find . -type d -exec chmod 755 {} \;

# Set proper permissions for files
sudo find . -type f -exec chmod 644 {} \;

# Make backup directory writable by Apache
sudo chmod 775 backups/
sudo chown www-data:www-data backups/

# Protect sensitive files
sudo chmod 600 includes/config.php
sudo chmod 600 includes/paymongo_config.php
sudo chown www-data:www-data includes/config.php
sudo chown www-data:www-data includes/paymongo_config.php
```

### Step 9.3: Create Upload Directories (if needed)
```bash
# Create uploads directory for product images
sudo mkdir -p /var/www/html/uploads/products

# Set permissions
sudo chown -R www-data:www-data /var/www/html/uploads
sudo chmod -R 775 /var/www/html/uploads
```

---

## 10. Testing & Verification

### Step 10.1: Test Apache Configuration
```bash
# Check Apache syntax
sudo apache2ctl configtest

# Check Apache status
sudo systemctl status apache2

# View recent Apache errors (if any)
sudo tail -f /var/log/apache2/kusso_error.log
```

### Step 10.2: Test Database Connection
```bash
# Create a test file
sudo nano /var/www/html/test_db.php
```

Add:
```php
<?php
require_once 'includes/config.php';

try {
    $stmt = $conn->query("SELECT COUNT(*) as count FROM users");
    $result = $stmt->fetch(PDO::FETCH_ASSOC);
    echo "Database connection successful!<br>";
    echo "Users in database: " . $result['count'];
} catch (Exception $e) {
    echo "Database connection failed: " . $e->getMessage();
}
?>
```

```bash
# Visit http://your-domain.com/test_db.php in browser
# Should show: "Database connection successful! Users in database: 1"

# Remove test file
sudo rm /var/www/html/test_db.php
```

### Step 10.3: Test Application Login
1. Open browser and visit: `http://your-domain.com` or `http://YOUR_SERVER_IP`
2. You should see the KUSSO login page
3. Login with:
   - Username: `admin`
   - Password: `password`
4. If successful, you'll be redirected to the dashboard

### Step 10.4: Check Error Logs
```bash
# Apache error log
sudo tail -50 /var/log/apache2/kusso_error.log

# MySQL error log
sudo tail -50 /var/log/mysql/error.log

# PHP error log (if configured)
sudo tail -50 /var/log/php8.3-fpm.log
```

---

## 11. Security Hardening

### Step 11.1: Change Default Admin Password
1. Login to the system
2. Go to User Management
3. Edit admin user
4. Change password to a strong password
5. Save changes

### Step 11.2: Disable PHP Error Display (Production)
```bash
# Edit PHP configuration
sudo nano /etc/php/8.3/apache2/php.ini

# Find and change:
display_errors = Off
display_startup_errors = Off
log_errors = On
error_log = /var/log/php_errors.log

# Save and restart Apache
sudo systemctl restart apache2
```

### Step 11.3: Create .htaccess for Extra Security
```bash
# Create .htaccess in includes directory
sudo nano /var/www/html/includes/.htaccess
```

Add:
```apache
# Deny all access to includes directory
Deny from all
```

```bash
# Create .htaccess in backups directory
sudo nano /var/www/html/backups/.htaccess
```

Add:
```apache
# Deny all access to backups directory
Deny from all
```

### Step 11.4: Configure Fail2Ban (Optional but Recommended)
```bash
# Install Fail2Ban
sudo apt install fail2ban -y

# Copy default configuration
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Edit configuration
sudo nano /etc/fail2ban/jail.local

# Find [sshd] section and ensure it's enabled
# Find [apache-auth] section and enable it

# Start and enable Fail2Ban
sudo systemctl start fail2ban
sudo systemctl enable fail2ban

# Check status
sudo fail2ban-client status
```

### Step 11.5: Regular Security Updates
```bash
# Enable automatic security updates
sudo apt install unattended-upgrades -y
sudo dpkg-reconfigure --priority=low unattended-upgrades
```

---

## 12. Maintenance & Backup

### Step 12.1: Create Backup Script
```bash
# Create backup script
sudo nano /usr/local/bin/kusso-backup.sh
```

Add:
```bash
#!/bin/bash

# Configuration
DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/var/backups/kusso"
DB_NAME="kusso"
DB_USER="root"
DB_PASS="YOUR_MYSQL_ROOT_PASSWORD"
WEB_ROOT="/var/www/html"

# Create backup directory
mkdir -p $BACKUP_DIR

# Backup database
mysqldump -u $DB_USER -p$DB_PASS $DB_NAME | gzip > $BACKUP_DIR/kusso_db_$DATE.sql.gz

# Backup files
tar -czf $BACKUP_DIR/kusso_files_$DATE.tar.gz $WEB_ROOT

# Delete backups older than 30 days
find $BACKUP_DIR -name "kusso_*" -mtime +30 -delete

echo "Backup completed: $DATE"
```

```bash
# Make script executable
sudo chmod +x /usr/local/bin/kusso-backup.sh

# Test the backup
sudo /usr/local/bin/kusso-backup.sh
```

### Step 12.2: Schedule Automatic Backups
```bash
# Edit crontab
sudo crontab -e

# Add this line for daily backups at 2 AM:
0 2 * * * /usr/local/bin/kusso-backup.sh >> /var/log/kusso-backup.log 2>&1
```

### Step 12.3: Monitor Disk Space
```bash
# Check disk usage
df -h

# Check specific directory usage
du -sh /var/www/html
du -sh /var/backups/kusso
```

### Step 12.4: Monitor System Resources
```bash
# Install htop for resource monitoring
sudo apt install htop -y

# Run htop
htop

# Press F10 to exit
```

### Step 12.5: Log Rotation
```bash
# Create log rotation config
sudo nano /etc/logrotate.d/kusso
```

Add:
```
/var/log/apache2/kusso_*.log {
    daily
    missingok
    rotate 14
    compress
    delaycompress
    notifempty
    create 0640 www-data adm
    sharedscripts
    postrotate
        systemctl reload apache2 > /dev/null 2>&1
    endscript
}
```

---

## Quick Reference Commands

### Service Management
```bash
# Restart Apache
sudo systemctl restart apache2

# Restart MySQL
sudo systemctl restart mysql

# Check all service status
sudo systemctl status apache2 mysql
```

### View Logs
```bash
# Apache access log
sudo tail -f /var/log/apache2/kusso_access.log

# Apache error log
sudo tail -f /var/log/apache2/kusso_error.log

# MySQL error log
sudo tail -f /var/log/mysql/error.log
```

### Database Management
```bash
# Login to MySQL
mysql -u root -p

# Backup database manually
mysqldump -u root -p kusso > kusso_backup.sql

# Restore database
mysql -u root -p kusso < kusso_backup.sql
```

### File Permissions Reset
```bash
cd /var/www/html
sudo chown -R www-data:www-data .
sudo find . -type d -exec chmod 755 {} \;
sudo find . -type f -exec chmod 644 {} \;
sudo chmod 600 includes/config.php includes/paymongo_config.php
```

---

## Troubleshooting

### Issue: "Permission Denied" errors
**Solution:**
```bash
sudo chown -R www-data:www-data /var/www/html
sudo chmod -R 755 /var/www/html
```

### Issue: "Database connection failed"
**Solution:**
1. Check MySQL is running: `sudo systemctl status mysql`
2. Verify credentials in `includes/config.php`
3. Test connection: `mysql -u root -p kusso`

### Issue: "500 Internal Server Error"
**Solution:**
```bash
# Check Apache error log
sudo tail -50 /var/log/apache2/kusso_error.log

# Check PHP syntax
php -l /var/www/html/index.php
```

### Issue: Cannot access website
**Solution:**
1. Check firewall: `sudo ufw status`
2. Check Apache status: `sudo systemctl status apache2`
3. Check virtual host: `sudo apache2ctl -S`

### Issue: SSL certificate errors
**Solution:**
```bash
# Check certificate validity
sudo certbot certificates

# Renew certificate
sudo certbot renew

# Restart Apache
sudo systemctl restart apache2
```

---

## Support & Resources

- **Apache Documentation:** https://httpd.apache.org/docs/2.4/
- **MySQL Documentation:** https://dev.mysql.com/doc/
- **PHP Documentation:** https://www.php.net/docs.php
- **Ubuntu Server Guide:** https://ubuntu.com/server/docs
- **PayMongo API Docs:** https://developers.paymongo.com/docs

---

## Security Notes

1. **ALWAYS** change the default admin password immediately
2. **NEVER** commit config files with real credentials to Git
3. **REGULARLY** update your server: `sudo apt update && sudo apt upgrade`
4. **MONITOR** your logs for suspicious activity
5. **BACKUP** your database and files regularly
6. **USE** strong passwords for all accounts
7. **ENABLE** two-factor authentication where possible
8. **KEEP** your PayMongo API keys secure and rotate them periodically

---

## Post-Deployment Checklist

- [ ] System updated to latest packages
- [ ] Apache, MySQL, PHP installed and configured
- [ ] Database created and schema imported
- [ ] Application files deployed
- [ ] Configuration files created and secured
- [ ] File permissions set correctly
- [ ] SSL certificate installed (if using domain)
- [ ] Admin password changed
- [ ] Backup script created and scheduled
- [ ] Firewall configured
- [ ] Error logs checked for issues
- [ ] Application tested and working
- [ ] Security headers configured
- [ ] Monitoring tools installed

---

**Deployment Date:** _______________
**Deployed By:** _______________
**Server IP/Domain:** _______________
**Notes:** _______________

---

*End of Deployment Guide*
