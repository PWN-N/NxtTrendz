.PHONY: build up down logs migrate superuser shell

BACKEND_IMAGE = nxttrendz-backend
FRONTEND_IMAGE = nxttrendz-frontend

DOCKER_ID = pwnnanaware
BACKEND = nxttrendz-backend
FRONTEND = nxttrendz-frontend
VERSION = v1
LATEST = latest

PUSH:
	docker tag $(BACKEND) $(DOCKER_ID)/$(BACKEND):$(VERSION)
	

build-image:
	docker build -t $(BACKEND_IMAGE) ./backend

run-image:
	docker run $(BACKEND_IMAGE)

remove-image:
	docker rmi $(BACKEND_IMAGE)

build:
	docker compose build

up:
	docker compose up -d --build

down:
	docker compose down

logs:
	docker compose logs -f backend

migrate:
	docker compose exec backend python manage.py migrate

superuser:
	docker compose exec backend python manage.py createsuperuser

shell:
	docker compose exec backend bash