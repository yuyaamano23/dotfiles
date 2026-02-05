.PHONY: setup help

help:
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  setup    Create symbolic links for all configurations"

setup:
	@bash ./bin/setup.sh
