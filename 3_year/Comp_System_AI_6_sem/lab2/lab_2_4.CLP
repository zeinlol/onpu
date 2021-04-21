(defrule stud
(stud (year ?z)(spec ai)(name ?x)(age ?y))
(test(<(- 25(+ ?y (- 5 ?z)))0))
=>
(printout t "Student " ?x " zakonchit obuchenie posle 25 let, tekushciy vozrast " ?y " curs " ?z crlf))