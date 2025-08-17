# Makefile

.PHONY: start stop logs import enter encrypt-secrets decrypt-secrets

## Start the Docker Compose stack
start:
	docker-compose up -d

## Stop the Docker Compose stack
stop:
	docker-compose down

## View logs of all services (Ctrl+C to exit)
logs:
	docker-compose logs -f

enter:
	docker-compose exec freshrss-application /bin/sh

helm-init:
ifndef HELM_CHART_DIR
	$(error HELM_CHART_DIR is not set. Usage: make helm-import HELM_CHART_DIR=./path/to/chart)
endif
	@echo "Initializing Helm chart in $(HELM_CHART_DIR)..."
	helm dependency update $(HELM_CHART_DIR)
	helm lint $(HELM_CHART_DIR)

## Encrypt values.yaml -> values.sops.yaml in the specified directory
encrypt-secrets:
ifndef SECRETS_DIR
	$(error SECRETS_DIR is not set. Usage: make encrypt-secrets SECRETS_DIR=./path/to/secrets)
endif
	sops --encrypt --age $$(cat age.pubkey) $(SECRETS_DIR)/values.dec.yaml > $(SECRETS_DIR)/values.sops.yaml
	@echo "Encrypted: $(SECRETS_DIR)/values.dec.yaml -> $(SECRETS_DIR)/values.sops.yaml"

decrypt-secrets:
ifndef SECRETS_DIR
	$(error SECRETS_DIR is not set. Usage: make decrypt-secrets SECRETS_DIR=./path/to/secrets)
endif
	@echo "Decrypting secrets..."
	@SOPS_AGE_KEY="$$(cat ./age.agekey)" \
		sops --decrypt $(SECRETS_DIR)/values.sops.yaml > $(SECRETS_DIR)/values.dec.yaml


