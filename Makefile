.PHONY: dev down start-nodered stop-nodered update-nodered

dev: down
	@docker-compose up

down:
	@docker-compose down --remove-orphans

start-nodered:
	@docker-compose start node-red

stop-nodered:
	@docker-compose stop node-red

update-nodered:
	cp -r ./data/nodered ./data/nodered_backup
	docker-compose pull node-red
	docker-compose stop node-red
	docker-compose rm -f node-red
	docker-compose up -d node-red
