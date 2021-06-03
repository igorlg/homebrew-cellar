PROTON_FILE = proton-2020-07-20.normal.json
WAITER_FILE = waiters2.json
ZIP_FILE    = aws-proton-preview.zip
CASK_FILE   = ../Casks/aws-proton-cli.rb

.PHONY: cask clean

$(ZIP_FILE): 
	zip $@ install.sh $(PROTON_FILE) $(WAITER_FILE)
	unzip -l $@

cask: $(ZIP_FILE)
	$(eval SHASUM := $(shell sha256sum $(ZIP_FILE) | awk '{print $$1}'))
	@echo "Old SUM:"
	@grep sha256 $(CASK_FILE) | awk '{print $$2}' | tr -d '"'
	@sed -i '' 's/sha256.*/sha256 "$(SHASUM)"/' $(CASK_FILE)
	@echo "New SUM IN FILE:"
	@grep sha256 $(CASK_FILE) | awk '{print $$2}' | tr -d '"'

clean:
	rm -f aws-proton-preview.zip

