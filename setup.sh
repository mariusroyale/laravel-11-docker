#!/bin/bash

set -e  # Exit on error

echo "🚀 Building containers..."
docker-compose build

echo "📦 Starting containers..."
docker-compose up -d

if [ ! -f backend/artisan ]; then
  echo "🎼 Installing Laravel 11 via Composer..."
  docker-compose exec app composer create-project laravel/laravel . "^11.0"
else
  echo "✅ Laravel already installed — skipping create-project"
fi

# Copy .env if missing
if [ ! -f backend/.env ]; then
  echo "🧪 Copying .env file..."
  cp backend/.env.example backend/.env
fi

echo "🔐 Generating Laravel app key..."
docker-compose exec app php artisan key:generate

echo "⏳ Waiting for Postgres to be ready..."
until docker-compose exec db pg_isready -U laravel; do
  sleep 2
done

echo "🎲 Running migrations..."
docker-compose exec app php artisan migrate

echo "📦 Installing Node.js dependencies..."
docker-compose exec node npm install

echo "✅ Setup complete!"
echo "🌐 Visit: http://localhost:8080"