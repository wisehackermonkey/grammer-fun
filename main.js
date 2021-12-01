import './style.css'
import nearley from "nearley" 
 
document.querySelector('#app').innerHTML = `
  <h1>Hello Vite!</h1>
  <a href="https://vitejs.dev/guide/features.html" target="_blank">Documentation</a>
`

const textInput = document.getElementById("text-input")
const output = document.getElementById("output")
document.getElementById("parse").addEventListener("click",()=>{
  
  console.log("worked",textInput.value)

  const parser = new nearley.Parser(nearley.Grammar.fromCompiled(grammar));
parser.feed(textInput.value)
let results = parser.results[0]
console.log(results);
output.innerText = JSON.stringify(results)

})
