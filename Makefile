## -------------------------------------------------------------------------
## Publish all podspec files to private repository
## See: https://guides.cocoapods.org/making/private-cocoapods.html
## -------------------------------------------------------------------------

.SILENT: push

## Pod repository name (previously registered)
REPO_NAME = "opentelemetry-swift-cocoapods"
WORK_DIR = Podspecs

## Execute when make without argument is called
all: update push

## Update pod repo list
.PHONY: update
update:
	pod repo update

## Push every private podspec files to the $REPO_NAME repository
.PHONY: push
push: $(WORK_DIR)/*.podspec
	for spec in $^ ; do \
  		pod repo push $(REPO_NAME) $${spec} --allow-warnings; \
	done
