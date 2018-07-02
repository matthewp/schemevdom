vdom.wasm: src/vdom.scm
	schism -o $@ $^

clean:
	@rm -f vdom.wasm
.PHONY: clean
