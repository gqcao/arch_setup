PROJECT=post-config
MD=pandoc
FORMAT=html
BUILDMD=$(MD) -s -o $(PROJECT).$(FORMAT) $(PROJECT).md

all:
	$(BUILDMD)

clean:
	rm -f *.$(FORMAT)
