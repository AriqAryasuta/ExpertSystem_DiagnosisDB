(defrule intro
    =>
    (printout t crlf "Apakah anda merasakan demam? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (assert(y_demam))
        else 
            (if(eq ?answer no) then
                  (printout t "Anda tidak memiliki gejala Demam, DB, Tipes, Chikungunya, dan malaria") 
            ) 
    )
)

(defrule pusing
    (y_demam)
    =>
    (printout t crlf "Apakah anda merasakan pusing? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (assert(y_pusing))
        else
            (if(eq ?answer no) then 
                (assert(n_pusing))
            )
    )
)

(defrule batuk
    (n_pusing)
    =>
    (printout t crlf "Apakah anda batuk-batuk? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then
            (assert(y_batuk))
        else
            (if(eq ?answer no) then
                (assert(n_batuk))
            )
    )
     
)

(defrule hidung_tersumbat
    (or(n_batuk)(y_batuk))
    =>
    (printout t crlf "Apakah hitung anda tersumbat? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (printout t "Anda memiliki gejala Flu")
        else
            (if(eq ?answer no) then 
                (printout t "anda memiliki gejala demam")
            )
    )
)

(defrule lelah
    (y_pusing)
    =>
    (printout t crlf "Apakah anda merasakan lelah? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (assert(y_lelah))
        else
            (if(eq ?answer no) then 
                (printout t "anda memiliki gejala demam")
            ) 
    )
    
)

(defrule pegal
    (y_lelah)
    =>
    (printout t crlf "Apakah anda merasakan pegal-pegal? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (assert(y_pegal))
        else
            (if(eq ?answer no) 
                then (printout t "anda memiliki gejala demam")
            )
    )
    
)

(defrule mual
    (y_pegal)
    =>
    (printout t crlf "Apakah anda merasakan mual? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (assert(y_mual))
        else
            (if(eq ?answer no) then 
                (assert(n_mual))
            )
    )
    
)

(defrule pegal_belakang_mata
    (or(y_mual)(n_mual))
    =>
    (printout t crlf "Apakah anda merasakan pegal pada belakang mata? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (printout t "anda memiliki gejala demam berdarah")
        else
            (if(eq ?answer no) then 
                (assert(n_pegalmata))
            )
    )
    
)

(defrule diare
    (n_pegalmata)
    =>
    (printout t crlf "Apakah anda mengalami diare? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (assert (y_diare))
        else
            (if(eq ?answer no) then 
                (assert(n_diare))
            )

    )
    
)

(defrule Sakit_perut
    (y_diare)
    =>
    (printout t crlf "Apakah anda merasakan sakit pada bagian perut (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (printout t "Anda memiliki gejala tifus")
        else
            (if(eq ?answer no) then 
                (assert(n_sakitperut))
            )     
    )
    
)

(defrule bercak
    (or (n_diare)(n_sakitperut))
    =>
    (printout t crlf "Apakah terdapat bercak merah pada tubuh anda? (yes/no)" crlf)
    (bind ?answer (read))
    (if(eq ?answer yes) then 
            (printout t "anda memiliki gejala chikungunya")
        else
            (if(eq ?answer no) then 
                (printout t "anda memiliki gejala malaria")
            )
    )
    
)

