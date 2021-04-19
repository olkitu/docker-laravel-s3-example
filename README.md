# Docker Laravel S3 Example

This is just for local testing use. Don't use on production.

Based [olkitu/docker-nginx-php-fpm](https://hub.docker.com/r/olkitu/docker-nginx-php-fpm) 

## Testing locally

Clone repository locally

```
git clone https://github.com/olkitu/docker-laravel-s3-example.git
```

Copy `.env.example` to `.env`.

Build and containers and then install Laravel with composer.

```
docker-compose build
docker-compose up -d
docker-compose exec web composer install
```

Or with [traefik](https://hub.docker.com/_/traefik)

```
docker-compose build
docker-compose -f docker-compose.traefik.yml up -d
docker-compose exec web compoer install
```

Generate Application Encryption key and save it to `APP_KEY` section of `.env` file on the root of the project

```
docker-compose exec web php artisan key:generate --show
```

And then restart web container

```
docker-compose up -d web
```

Then navigate to http://localhost:8080 (If use traefik on Chrome you can use http://laravel.localhost) and test image upload. You can browse then images via Minio http://localhost:9000 (If you use traefik, on Chrome you can use http://minio.localhost). Login with Root Bucket Keys in `.env` file.