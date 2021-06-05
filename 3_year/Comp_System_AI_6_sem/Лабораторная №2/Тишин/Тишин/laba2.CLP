(deftamplate student
(slot name)		; имя студента
(slot age)		; возраст
(slot year)		; год обучения (курс)
(slot spec)		; специализация
(slot aver_mark))	; средний балл

(deffacts students
(student (name John) (age 17) (year 1) (spec "hard") (aver_mark 4.5))
(student (name Alan) (age 18) (year 2) (spec "hard") (aver_mark 4.5))
(student (name Ron)  (age 19) (year 3) (spec "hard") (aver_mark 4.5))

(student (name Anna) (age 18) (year 1) (spec "hard") (aver_mark 4.5))
(student (name Eren) (age 19) (year 2) (spec "hard") (aver_mark 4.5))
(student (name Danny) (age 20) (year 3) (spec "hard") (aver_mark 4.5))

(student (name Mark) (age 20) (year 1) (spec "hard") (aver_mark 4.5))
(student (name Maria) (age 20) (year 2) (spec "hard") (aver_mark 4.5))
(student (name Britney) (age 20) (year 3) (spec "hard") (aver_mark 4.5))

(student (name ) (age 18) (year 1) (spec "hard") (aver_mark 4.5))
(student (name John) (age 18) (year 2) (spec "hard") (aver_mark 4.5))
(student (name John) (age 19) (year 3) (spec "hard") (aver_mark 4.5))
) 

  