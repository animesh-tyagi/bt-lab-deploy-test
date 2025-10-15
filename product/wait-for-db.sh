#!/usr/bin/env bash
set -e

host="$1"
port="${2:-3306}"
user="${3:-root}"
pass="${4:-root}"

echo "🕒 Waiting for MySQL at $host:$port..."
until mysqladmin ping -h"$host" -u"$user" -p"$pass" --silent; do
  printf '.'
  sleep 2
done
echo ""
echo "✅ MySQL is up - starting application"

shift 4
exec "$@"
