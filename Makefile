validate:
	ls -1d modules/* | xargs -n1 -I{} sh -c "cd {}; echo {}; terraform init && terraform validate"

lint:
	ls -1d modules/* | xargs -n1 tflint 
	ls -1d examples/* | xargs -n1 tflint 

test:
	go test

docs:
	ls -1d modules/* | xargs -n1 -I{} sh -c "terraform-docs markdown table --output-file README.md --output-mode replace {}"

