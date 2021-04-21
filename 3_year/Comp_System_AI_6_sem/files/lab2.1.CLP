(deftemplate student 
(slot name)
(slot age)
(slot year)
(slot spec)
(slot aver_mark))

(deffacts students
(student (name Alekseev) (age  20) (year  4)  (spec "hard") (aver_mark 4))
(student (name Ivanov) (age  21) (year  4)  (spec "soft") (aver_mark 4.8))
(student (name Pyatkovskaya) (age  22) (year  5)  (spec "ai") (aver_mark 4.1))
(student (name Popko) (age  19) (year  3)  (spec "soft") (aver_mark 4))
(student (name Shalin) (age  20) (year  5)  (spec "ai") (aver_mark 3.5))
(student (name Lebedev) (age 20) (year 3) (spec "hard") (aver_mark 4.5))
(student (name Kostynenko) (age 21) (year 3) (spec "hard") (aver_mark 3))
(student (name Savich) (age 21) (year 2) (spec "soft") (aver_mark 4.5))
(student (name Dunskaya) (age 18) (year 2) (spec "soft") (aver_mark 5))
(student (name Timchenko) (age 23) (year 3) (spec "soft") (aver_mark 3))
(student (name Golovenko) (age 22) (year 2) (spec "hard") (aver_mark 4))
(student (name Melnichuk) (age 20) (year 3) (spec "hard") (aver_mark 4.5))
(student (name Tsukanov) (age 21) (year 3) (spec "ai") (aver_mark 3))
(student (name Zubov) (age 19) (year 2) (spec "soft") (aver_mark 4.5))
(student (name Ovcharenko) (age 18) (year 2) (spec "ai") (aver_mark 5))
(student (name Savichev) (age 17) (year 3) (spec "soft") (aver_mark 3))
(student (name Shibaev) (age 17) (year 2) (spec "ai") (aver_mark 4))
(student (name Voznaya) (age  20) (year  4)  (spec "ai") (aver_mark 4))
(student (name Kuzin) (age  21) (year  2)  (spec "soft") (aver_mark 5))
)


(defrule R1
	(student (name ?name) (age  ?age) (year ?year) (spec ?spec) (aver_mark ?aver_mark))
        (test(and(>= ?aver_mark 4.5)(or(= ?year 2))))
=>
(printout t crlf "Student " ?name " imeet sredniy bal " ?aver_mark  crlf ))
