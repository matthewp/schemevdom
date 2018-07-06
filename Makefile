INFOLOG := \033[34m ▸\033[0m
WARNLOG := \033[33m ▸\033[0m
ERROLOG := \033[31m ⨯\033[0m

vdom.wasm: src/vdom.scm
	@echo "$(INFOLOG) Compiling $@"
	@schism -o $@ $^
	@echo "$(INFOLOG) $@ successfully compiled"

clean:
	@rm -f vdom.wasm
.PHONY: clean

serve:
	http-server -p 8026
.PHONY: serve

watch:
	find src -name *.scm | entr make vdom.wasm
.PHONY: watch

dev:
	make watch & make serve
.PHONY: dev
