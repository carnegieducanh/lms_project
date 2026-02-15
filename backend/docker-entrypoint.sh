#!/usr/bin/env bash
set -e

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations..."
php artisan migrate --force || echo "WARN: Migration failed - kiểm tra MYSQL_PUBLIC_URL / DB. Chạy migrate thủ công sau."

exec "$@"

exec "$@"
