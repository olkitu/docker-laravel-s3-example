# Docker Laravel S3 Example

This is just for local testing use. Don't use on production.

Clone repository locally

```
git clone https://github.com/olkitu/docker-laravel-s3-example
```

Copy `.env.example` to `.env`.

Build and containers and then install Laravel with composer.

```
docker-compose build
docker-compose up -d
docker-compose exec web composer install
```

Generate Application Encryption key and save it to `APP_KEY` section of `.env` file on the root of the project

```
docker-compose exec web php artisan key:generate --show
```

And then restart web container

```
docker-compose up -d web
```

Then navigate to https://localhost:8080 and test image upload. You can browse then images via Minio http://localhost:9000 . Login with Root Bucket Keys in `.env` file.