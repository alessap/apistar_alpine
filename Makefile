build:
	docker build -t apistar .

run:
	docker run apistar

create_env:
	virtualenv venv 

install:
	pip install -r requirements.txt
	