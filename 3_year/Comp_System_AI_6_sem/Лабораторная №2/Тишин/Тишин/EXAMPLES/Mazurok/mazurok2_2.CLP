(defrule stud
(stud (year 5)(spec Rock)(name ?x)(age ?y))
(test(>(- ?y 19)0))

=>
(printout t "Student " ?x " u4itsia na 5 kurse, vozrast " ?y crlf))