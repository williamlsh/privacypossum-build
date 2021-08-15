.PHONY: all
all: build unzip manifest

.PHONY: build
build:
	@docker build \
	--target=releaser \
	--output=. \
	.

.PHONY: unzip
unzip:
	@rm -rf possum
	@unzip possum.zip -d possum

# This strips 'applications' from built possum manifest.json beacause chrome can't recognize it.
.PHONY: manifest
manifest:
	@jq 'del(.applications)' possum/manifest.json > possum/tmp && mv possum/tmp possum/manifest.json
