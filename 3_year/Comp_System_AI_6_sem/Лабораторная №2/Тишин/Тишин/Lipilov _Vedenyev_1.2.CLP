(deffacts LABA (Days_Left 7)(Works_to_do 3)(Temperature cold)(Rain_exist rain))


(defrule R1(Days_Left 1)(Works_to_do 1)=>(assert (free_time_left not_many)))
(defrule R2(Days_Left 1)(Works_to_do 2)=>(assert (free_time_left not_many)))
(defrule R3(Days_Left 1)(Works_to_do 3)=>(assert (free_time_left no_time_left)))

(defrule R4(Days_Left 7)(Works_to_do 1)=>(assert (free_time_left many)))
(defrule R5(Days_Left 7)(Works_to_do 2)=>(assert (free_time_left not_many)))
(defrule R6(Days_Left 7)(Works_to_do 3)=>(assert (free_time_left not_many)))

(defrule R7(Days_Left 14)(Works_to_do 1)=>(assert (free_time_left many)))
(defrule R8(Days_Left 14)(Works_to_do 2)=>(assert (free_time_left many)))
(defrule R9(Days_Left 14)(Works_to_do 3)=>(assert (free_time_left many)))



(defrule R10(Temperature cold)(Rain_exist rain)=>(assert (weather bad)))
(defrule R11(Temperature cold)(Rain_exist no rain)=>(assert (weather normal)))
(defrule R12(Temperature cold)(Rain_exist sunny)=>(assert (weather good)))

(defrule R13(Temperature warm)(Rain_exist rain)=>(assert (weather normal)))
(defrule R14(Temperature warm)(Rain_exist no rain)=>(assert (weather good)))
(defrule R15(Temperature warm)(Rain_exist sunny)=>(assert (weather good)))

(defrule R16(Temperature hot)(Rain_exist rain)=>(assert (weather normal)))
(defrule R17(Temperature hot)(Rain_exist no rain)=>(assert (weather normal)))
(defrule R18(Temperature hot)(Rain_exist sunny)=>(assert (weather bad)))



(defrule R19(free_time_left no_time_left)(weather bad)=>(assert (act rabotat)))
(defrule R20(free_time_left no_time_left)(weather normal)=>(assert (act rabotat)))
(defrule R21(free_time_left no_time_left)(weather good)=>(assert (act rabotat)))

(defrule R22(free_time_left not_many)(weather bad)=>(assert (act rabotat)))
(defrule R23(free_time_left not_many)(weather normal)=>(assert (act gulyat)))
(defrule R24(free_time_left not_many)(weather good)=>(assert (act gulyat)))

(defrule R25(free_time_left many)(weather bad)=>(assert (act rabotat)))
(defrule R26(free_time_left many)(weather normal)=>(assert (act gulyat)))
(defrule R27(free_time_left many)(weather good)=>(assert (act gulyat)))
