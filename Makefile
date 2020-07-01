
FLASK_APP=main.py

.PHONY: install
install:
	if [ -f .installed ]; then rm -f .installed; fi
	@$(MAKE) .installed


.installed: pyproject.toml poetry.lock
	# pyproject.toml or poetry.lock are newer than .installed, (re)installing in 1 second
	sleep 1
	poetry install
	@echo "This file is used by 'make' for keeping track of last install time. If pyproject.toml or poetry.lock are newer then this file (.installed) then all 'make *' commands that depend on '.installed' know they need to run 'poetry install' first." \
		> .installed

.PHONY: run
run: 
	
	poetry run flask run
