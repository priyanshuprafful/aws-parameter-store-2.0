dev:
	git pull
	@rm -rf .terraform
	@terraform init 
	@terraform apply -auto-approve


