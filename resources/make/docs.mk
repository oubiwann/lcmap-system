.PHONY: docs

ROOT_DIR = $(shell pwd)
DOCS_DIR = $(ROOT_DIR)/docs
REPO = $(shell git config --get remote.origin.url)
DOCS_BUILD_DIR = $(DOCS_DIR)/build
DOCS_PROD_DIR = $(DOCS_DIR)/master
SLATE_GIT_HACK = $(DOCS_DIR)/.git

$(SLATE_GIT_HACK):
	ln -s $(ROOT_DIR)/.git $(DOCS_DIR)

docs-setup:
	@echo "Installing and setting up dependencies ..."
	@cd $(DOCS_DIR) && bundle install

devdocs:
	@echo "Running development server ..."
	@cd $(DOCS_DIR) && bundle exec middleman server

clean-build:
	@echo "Cleaning build directory ..."
	@rm -rf $(DOCS_BUILD_DIR)

docs: clean-build
	@echo "Building docs ..."
	@cd $(DOCS_DIR) && bundle exec middleman build --clean

commit:
	@echo "Commiting changes ..."
	@-git commit -a && git push --all

setup-temp-repo: $(SLATE_GIT_HACK)
	@echo "Setting up temporary git repos for gh-pages ..."
	@rm -rf $(DOCS_PROD_DIR)/current $(DOCS_PROD_DIR)/.git $(DOCS_PROD_DIR)/*/.git
	@cp -r $(DOCS_BUILD_DIR) $(DOCS_PROD_DIR)/current
	@cd $(DOCS_PROD_DIR) && git init
	@cd $(DOCS_PROD_DIR) && git add * > /dev/null
	@cd $(DOCS_PROD_DIR) && git commit -a -m "Generated content." > /dev/null

teardown-temp-repo:
	@echo "Tearing down temporary gh-pages repos ..."
	@rm $(DOCS_DIR)/.git $(DOCS_DIR)/Gemfile.lock
	@rm -rf $(DOCS_PROD_DIR)/.git $(DOCS_PROD_DIR)/*/.git

publish: commit docs setup-temp-repo
	@echo "Publishing docs ..."
	@cd $(DOCS_PROD_DIR) && git push -f $(REPO) master:gh-pages
	@make teardown-temp-repo
