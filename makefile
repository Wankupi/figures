src				= $(shell pwd)
dest_dir		= build
DRAWIO			= /opt/drawio/drawio
DRAWIO_FLAGS	= -x --scale 2 -t

DRAWIO_FILES	:= $(shell find "$(src)" -name '*.drawio')
PNG_FILES		:= $(patsubst $(src)/%.drawio,$(dest_dir)/%.png,$(DRAWIO_FILES))

all: $(PNG_FILES)

clean:
	@rm -r "$(dest_dir)"

$(dest_dir)/%.png: $(src)/%.drawio
	@echo $*
	@mkdir -p "$(dir $@)"
	@$(DRAWIO) $(DRAWIO_FLAGS) -o "$@" "$<" >/dev/null

.PNONY: all clean
