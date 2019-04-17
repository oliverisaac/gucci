
VERSION ?= $(shell cat VERSION)
LDFLAGS = -X main.AppVersion=${VERSION}


.PHONY: release
release: 
	mkdir -p release
	GOOS=linux  GOARCH=amd64 go build -ldflags "${LDFLAGS}" -o release/gucci-v${VERSION}-linux-amd64
	GOOS=darwin GOARCH=amd64 go build -ldflags "${LDFLAGS}" -o release/gucci-v${VERSION}-darwin-amd64
	git tag ${VERSION}
	git push origin --tags

