(defrule stud
(stud (year ?z)(spec ai)(name ?x)(age ?y))
(test(>(- ?y 20)0))

=>
(printout t "Vozrast studenta " ?x " " ?y " let" crlf))