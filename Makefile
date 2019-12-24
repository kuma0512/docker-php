up:
	docker-compose up -d
create-project:
	docker-compose up -d --build
	docker-compose exec app composer create-project --prefer-dist laravel/laravel .
	docker-compose exec app require predis/predis
install:
	docker-compose up -d --build
	docker-compose exec app composer install
	docker-compose exec app cp .env.example .env
	docker-compose exec app php artisan key:generate
	docker-compose exec app php artisan migrate:fresh
npm:
	docker-compose exec node npm install
	docker-compose exec node npm run dev
yarn:
	docker-compose exec node yarn
	docker-compose exec node yarn run dev
