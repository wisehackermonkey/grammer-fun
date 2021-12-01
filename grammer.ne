@builtin "whitespace.ne"
@builtin "number.ne" 

 
main ->  statement   {%([text])=>([ text.flat(100)])%}

statement ->  statement "\n" statement {%([text,,text2])=>([text,text2])%}

statement ->  "\n" _ bold _ {%([,,text])=>([text])%} 
statement ->  _ bold _  {%([,text])=>([text])%} 

statement -> _ LETTERS _ {%([,,text])=>([text])%}


bold -> "*" _ LETTERS _ "*"  {%([,,text])=>({type:"bold","value":text})%}

bold -> "*" _ bold _ "*" {%([,,text])=>(text)%}


LETTERS -> [a-zA-Z ]:+ {%d=> d[0].join("")%}