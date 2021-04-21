(defrule stud
(stud (year ?z)(spec ai)(name ?x)(age ?y))
(data ?z&:(integerp ?z))

=>
(printout t "Vozrast studenta " ?x " " ?y " let" crlf))