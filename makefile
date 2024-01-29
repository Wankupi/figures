src = $(shell pwd)

DRAWIO=/opt/drawio/drawio
DRAWIO_FLAGS=-x --scale 2 -t

sources = $(shell find "$(src)" -name '*.drawio')
pngs = $(sources:.drawio=.png)

all: $(pngs)

clean:
	@find "$(src)" -name '*.png' -exec rm {} \;

%.png: %.drawio
	@echo "$@"
	@$(DRAWIO) $(DRAWIO_FLAGS) -o "$@" "$<" >/dev/null

.PNONY: all clean
