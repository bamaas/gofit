.PHONY: $(MAKECMDGOALS)
.EXPORT_ALL_VARIABLES:

# Build env
SHELL = /bin/bash
GO_BINARY=$(shell which go)

# App
APP_NAME=gofit
APP_VERSION?=0.0.3

# Backend
GO_VERSION=1.22

# Image
# IMAGE_REGISTRY=docker.io
IMAGE_REPOSITORY=bamaas/${APP_NAME}
IMAGE_TAG?=${APP_VERSION}
IMAGE?=${IMAGE_REPOSITORY}:${IMAGE_TAG}

# Backend

get_backend_image:
	@echo ${IMAGE}

run_backend:
	cd ./backend && go run ./cmd/${APP_NAME}/

backend:																						## Build an application container image
	docker build -f ./backend/build/Dockerfile -t ${IMAGE} ./backend

push_backend:
	docker push ${IMAGE}

# Frontend
frontend:
	cd frontend && npm run build