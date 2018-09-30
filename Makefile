build:
	docker build -t apistar .

run:
	docker run -p 5000:5000 apistar

stop:
	docker kill $(docker ps | grep apistar | awk '{print $1}')

create_env:
	virtualenv venv 

install:
	pip install -r requirements.txt

zip:
	$(eval commit-id=$(shell git rev-parse HEAD))
	zip -x app/__pycache__/\* -r $(commit-id) run.py requirements.txt Dockerfile app/

deploy:
	$(eval zip_file=$(shell git rev-parse HEAD).zip)
	echo $(zip_file)
	aws elasticbeanstalk create-application-version \
		--application-name apistar_alpine \
		--version-label v1 \
		--source-bundle S3Bucket=elasticbeanstalk-eu-central-1-272588537707,S3Key=$(zip_file)


create_eb_app:
	aws elasticbeanstalk create-application \
		--application-name apistar_alpine 
		--description "my application using docker and apistar"

	aws elasticbeanstalk describe-application-versions \
		--application-name apistar_alpine \
		--version-label v1

	aws elasticbeanstalk create-environment \
		--cname-prefix apistar-alpine-env1 \
		--application-name apistar_alpine \
		--template-name v1 \
		--version-label v1 \
		--environment-name v1clone
