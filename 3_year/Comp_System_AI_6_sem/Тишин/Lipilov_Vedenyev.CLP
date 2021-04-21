(deffacts startup "Lipilov_Vedenyev"
(x)
(y)
(z)
)
(defrule first
(x)
(y)
=>
(assert (v)))

(defrule second
(y)
(z)
=>
(assert (w)))

(defrule third
(v)
(w)
=>
(assert (u)))
