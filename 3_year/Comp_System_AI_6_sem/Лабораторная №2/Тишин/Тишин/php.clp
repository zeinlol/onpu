(reset)
(assert (nn)(mm)(pp))
(reset)
(deffacts facts (n)(m)(p))
(reset)
(defrule Rn1 (n)(m)(p)=>(printout t crlf "Свободного времени нет" crlf))

