.PHONY: all
all: make cli 
.PHONY: cli
cli:
	(mkdir /opt/stingless)
	(cp -rf ./bcc /opt/stingless/bcc)
	(export PATH=$PATH:/opt/stingless/bcc) 	
	(go build -o /usr/bin/stingless)
.PHONY: install
install:
	(go install github.com/spf13/cobra-cli@latest)
.PHONY: uninstall
uninstall:
	(rm -rf /opt/stingless)
	(rm /usr/bin/stingless)
