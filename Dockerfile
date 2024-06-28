FROM php:8.3-fpm
FROM nginx:latest
RUN apt-get update && apt-get install -y nginx-full
# نصب پسوندهای PHP مورد نیاز
RUN docker-php-ext-install pdo pdo_mysql

# نصب Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# تنظیم دایرکتوری کاری
WORKDIR /var/www

# کپی فایل‌های پروژه
COPY . .

# نصب وابستگی‌های لاراول
RUN composer install

# تنظیم دسترسی‌های لازم
RUN chown -R www-data:www-data /var/www
RUN chmod -R 755 /var/www
RUN chmod -R 777 /var/www/storage

# اجرای سرویس PHP-FPM
CMD ["php-fpm"]
