# Laravel 11 + PHP 8.4 Fpm on Docker Development Environment

This repository contains a Laravel 11 application set up with Docker using:

- PHP 8.4 (FPM, Alpine)
- Nginx (latest)
- PostgreSQL (latest)
- Node.js + npm (latest) with Vite
- Docker Compose for orchestration

---

## Quick Start

### 1. Build and start containers

```bash
./setup.sh
```

(or manually:)

```bash
docker-compose build
docker-compose up -d
```

### 2. Install Laravel and dependencies

If not using \`setup.sh\`, run:

```bash
docker-compose exec app composer create-project laravel/laravel . "^11.0"
docker-compose exec app php artisan key:generate
docker-compose exec app php artisan migrate
docker-compose exec node npm install
```

### 3. Access the application

Open your browser at [http://localhost:8080](http://localhost:8080)

---

## Environment Variables

Make sure your \`.env\` file has the following database settings for PostgreSQL:

```env
DB_CONNECTION=pgsql
DB_HOST=db
DB_PORT=5432
DB_DATABASE=laravel
DB_USERNAME=laravel
DB_PASSWORD=secret
```

---

## Running Artisan and npm commands

You can run Laravel and Node commands inside their respective containers:

```bash
docker-compose exec app php artisan migrate
docker-compose exec node npm run dev
```

---

## Troubleshooting

- If Laravel cannot connect to Postgres, ensure containers are up and Postgres is ready.
- Restart containers if you update \`postgresql.conf\` or \`.env\`.

---

## License

MIT License

---

Feel free to contribute or ask for help!

## GitHub Profile

Check out more of my projects on GitHub:  
[https://github.com/mariusroyale](https://github.com/mariusroyale)