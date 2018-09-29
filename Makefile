build:
	docker build -t apistar .

run:
	docker run -p 5000:5000 apistar

create_env:
	virtualenv venv 

install:
	pip install -r requirements.txt

zip:
	$(eval commit-id=$(shell git rev-parse HEAD))
	zip -x app/__pycache__/\* -r $(commit-id) run.py requirements.txt Dockerfile app/
