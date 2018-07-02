import { load } from './diff.js';

const editor = document.querySelector('#editor');

var actualCode = `
'(div (id "main")
  "Hello world")
`.trim();

const myCodeMirror = CodeMirror(editor, {
  value: `;; Edit this file and it will\n;; compile automatically.\n\n${actualCode}`,
  lineNumbers: true,
  mode:  "scheme"
});

async function begin() {
  const btn = document.querySelector('.run');
  const differ = await load();
  const runDemo = differ.exports['run-demo'];

  btn.onclick = function(){
    let out = runDemo();
    console.log("CLICKED");
  };
  btn.removeAttribute("disabled");
}

begin();
