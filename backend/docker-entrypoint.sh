#!/usr/bin/env bash
set -e

echo "Caching config..."
php artisan config:cache

echo "Caching routes..."
php artisan route:cache

echo "Running migrations (retry tối đa 6 lần, mỗi lần cách 5s)..."
for i in 1 2 3 4 5 6; do
  if php artisan migrate --force > /tmp/migrate.log 2>&1; then
    echo "Migration completed."
    break
  fi
  if [ "$i" -eq 6 ]; then
    echo "WARN: Migration failed sau 6 lần thử. App vẫn chạy."
    echo "--- Lỗi chi tiết (kiểm tra MYSQL_PUBLIC_URL trên Render): ---"
    cat /tmp/migrate.log
    echo "---"
  else
    echo "Migration attempt $i failed, retry in 5s..."
    sleep 5
  fi
done

exec "$@"
