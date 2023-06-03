# Переменные
COMMENT = ""

.PHONY: revision

# Создание ревизии
revision:
	alembic revision --autogenerate -m "$(COMMENT)"

upgrade:
	alembic upgrade head

run:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

build:
	docker-compose up -d --build