.PHONY: up down start-nodered stop-nodered start-deconz stop-deconz dirfix-nodered update-nodered

up: down
	@docker-compose up

down:
	@docker-compose down --remove-orphans

start-nodered:
	@docker-compose start node-red

stop-nodered:
	@docker-compose stop node-red

start-deconz:
	@docker-compose start deconz

stop-deconz:
	@docker-compose stop deconz

dirfix-nodered:
	-mkdir ./node-red/data
	sudo chown -R 1000:1000 ./node-red/data

update-nodered:
	cp -r ./data/nodered ./data/nodered_backup
	docker-compose pull node-red
	docker-compose stop node-red
	docker-compose rm -f node-red
	docker-compose up -d node-red
