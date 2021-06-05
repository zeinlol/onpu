(defrule stud
(stud (year 5)(spec hard)(name ?x)(age ?y))

=>
(printout t "Student " ?x " prohodit obuchenie na 5 kurse, vozrast " ?y crlf))