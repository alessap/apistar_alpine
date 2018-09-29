build:
	docker build -t apistar .

run:
	docker run -p 5000:5000 apistar

create_env:
	virtualenv venv 

install:
	pip install -r requirements.txt
