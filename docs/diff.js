import { Engine } from './rt.mjs';

const wasm = fetch('./vdom.wasm', { credentials: 'include' });

export async function load() {
  const engine = new Engine();

  const wasmBytes = await wasm;
  const wasmab = await wasmBytes.arrayBuffer();
  const mod = await engine.loadWasmModule(wasmab);
  return mod;
}
