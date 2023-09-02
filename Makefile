.PHONY: all
all: make cli 
.PHONY: cli
cli:
	(mkdir /opt/stingless/)
	(mkdir /opt/stingless/bcc)
	(mkdir /opt/stingless/bcc/tools)
	(cp -rf ./bcc/tools/* /opt/stingless/bcc/tools)
	(go build -o /usr/bin/stingless)
.PHONY: install
install:
	(go install github.com/spf13/cobra-cli@latest)
.PHONY: uninstall
uninstall:
	(rm -rf /opt/stingless)
	(rm /usr/bin/stingless)
