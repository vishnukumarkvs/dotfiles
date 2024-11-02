# My dotfiles

## Automation

- This github repo is within github-copy in my local directory
- This setup is done as symlinks are not stored in git fully
- I am copying the symlinks data in github_copy and pushing it to my remote repo

### Makefile
```
GITHUB_DIR := github-copy

all: copy-content push

# Copy the contents of the symlinks and create directories as needed
copy-content:
	@echo "Creating directory structure and copying symlink contents..."
	@mkdir -p $(GITHUB_DIR)
	@find . -type l | while read link; do \
	  target=$$(readlink $$link); \
	  if [ -f "$$target" ]; then \
	    mkdir -p $(GITHUB_DIR)/$$(dirname $$link); \
	    cp $$target $(GITHUB_DIR)/$$link; \
	  fi; \
	done

# Push the new structure to GitHub
push:
	@echo "Adding and pushing changes to GitHub..."
	@cd $(GITHUB_DIR) && git add . && git commit -m "Added or updated actual file contents" && git push origin main
```

- I am getting contents of file from its symlinks and copying it to github_copy
