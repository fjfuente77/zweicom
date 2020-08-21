build:
	@echo "== Build image for service =="
	docker build . --rm -t zweicom

run:
	@echo "== Run service in port 5000 =="
	docker run -d -p 5000:5000 --name zweicom_service zweicom:latest 

test:
	@echo "== Test service =="
	./test.sh

down:
	@echo "== stop and remove container =="
	docker stop zweicom_service
	docker rm zweicom_service

deploy: build run test down