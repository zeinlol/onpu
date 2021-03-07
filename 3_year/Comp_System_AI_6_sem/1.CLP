(deffacts startup "Refrigerator Status"
(x)
(y)
(z)
)
(defrule R1
(x)
(y)
=>
(assert (v)))

(defrule R2
(y)
(z)
=>
(assert (w)))

(defrule R3
(v)
(w)
=>
(assert (u)))

