.PHONY: setup serve help

help:
	@echo "Available commands:"
	@echo "  make setup  - Create venv and install dependencies"
	@echo "  make serve  - Start mkdocs server (run setup first)"

setup:
	python -m venv .venv && . .venv/bin/activate && pip install -r requirements.txt

serve:
	. .venv/bin/activate && mkdocs serve -a 0.0.0.0:8000
