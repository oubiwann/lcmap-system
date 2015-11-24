.PHONY: docs
REPO = $(shell git config --get remote.origin.url)
CWD = $(shell pwd)
DOCS_DIR = $(CWD)/docs
DOCS_BUILD_DIR = $(DOCS_DIR)/build
DOCS_PROD_DIR = $(DOCS_DIR)/master
SLATE_GIT_HACK = $(DOCS_DIR)/.git

$(SLATE_GIT_HACK):
	cd $(DOCS_DIR) && ln -s ../.git .

docs-setup:
	cd docs && bundle install

devdocs: $(SLATE_GIT_HACK)
	cd docs && bundle exec middleman server

docs: $(SLATE_GIT_HACK)
	cd docs && rake build

commit:
	-git commit -a && git push --all

publish: commit docs
	rm -rf $(DOCS_PROD_DIR)/current $(DOCS_DIR)/.git $(DOCS_PROD_DIR)/.git $(DOCS_PROD_DIR)/*/.git
	cp -r $(DOCS_BUILD_DIR) $(DOCS_PROD_DIR)/current
	cd $(DOCS_PROD_DIR) && \
	git init && \
	git add * &> /dev/null && \
	git commit -a -m "Generated content." &> /dev/null && \
	git push -f $(REPO) master:gh-pages
	rm -rf $(DOCS_DIR)/.git $(DOCS_PROD_DIR)/.git $(DOCS_PROD_DIR)/*/.git
