.DEFAULT_GOAL := help

.PHONY: help
help:  ## Show this help.
	@grep -E '^\S+:.*?## .*$$' $(firstword $(MAKEFILE_LIST)) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "%-30s %s\n", $$1, $$2}'

.PHONY: up
up: ## Start all the Docker services
	docker compose up -d

.PHONY: down
down: ## Stop and remove all the Docker services, volumes and networks
	docker compose down -v --remove-orphans
