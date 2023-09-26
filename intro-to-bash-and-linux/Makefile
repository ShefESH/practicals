default: help

build: ## Build image from scratch
		@docker-compose build --no-cache

run: ## Run docker compose
		@docker compose up --build

up: ## Run docker compose in daemon mode
		@docker compose up -d --build

down: ## Shut down the running docker daemon and delete its volumes
		@docker compose down -v

help: ## Display this help message
		@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)
