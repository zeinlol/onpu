(deffacts LABA (Days 1)(Works 3)(Temper cold)(Rain rain))


(defrule R1(Days 1)(Works 1)=>(assert (free_time yes)))
(defrule R2(Days 1)(Works 2)=>(assert (free_time maybe)))
(defrule R3(Days 1)(Works 3)=>(assert (free_time no)))

(defrule R4(Days 7)(Works 1)=>(assert (free_time yes)))
(defrule R5(Days 7)(Works 2)=>(assert (free_time maybe)))
(defrule R6(Days 7)(Works 3)=>(assert (free_time no)))

(defrule R7(Days 14)(Works 1)=>(assert (free_time yes)))
(defrule R8(Days 14)(Works 2)=>(assert (free_time yes)))
(defrule R9(Days 14)(Works 3)=>(assert (free_time maybe)))



(defrule R10(Temper cold)(Rain rain)=>(assert (weather bad)))
(defrule R11(Temper cold)(Rain no rain)=>(assert (weather normal)))
(defrule R12(Temper cold)(Rain snow)=>(assert (weather bad)))

(defrule R13(Temper warm)(Rain rain)=>(assert (weather normal)))
(defrule R14(Temper warm)(Rain no rain)=>(assert (weather good)))
(defrule R15(Temper warm)(Rain snow)=>(assert (weather normal)))

(defrule R16(Temper hot)(Rain rain)=>(assert (weather bad)))
(defrule R17(Temper hot)(Rain no rain)=>(assert (weather normal)))
(defrule R18(Temper hot)(Rain snow)=>(assert (weather bad)))



(defrule R19(free_time no)(weather bad)=>(assert (act work)))
(defrule R20(free_time no)(weather normal)=>(assert (act work)))
(defrule R21(free_time no)(weather good)=>(assert (act work)))

(defrule R22(free_time maybe)(weather bad)=>(assert (act work)))
(defrule R23(free_time maybe)(weather normal)=>(assert (act play)))
(defrule R24(free_time maybe)(weather good)=>(assert (act play)))

(defrule R25(free_time yes)(weather bad)=>(assert (act work)))
(defrule R26(free_time yes)(weather normal)=>(assert (act play)))
(defrule R27(free_time yes)(weather good)=>(assert (act play)))
