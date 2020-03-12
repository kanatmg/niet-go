ENTRY_FILE=cmd/niet-go/main.go
DEST=bin/niet

all:
	go build -o ${DEST} ${ENTRY_FILE}

clean:
	rm -f ${DEST}