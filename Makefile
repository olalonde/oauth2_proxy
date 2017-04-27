build:
	docker build -t oauth2_proxy .
run-interactive:
	docker run --rm -it oauth2_proxy sh