(define (problem switch_toggle_prob) (:domain switch_toggle)
    (:objects
        s1 s2 s3 - switch 
    )

    (:init
        (switch_on s2)
    )

    (:goal (and
        (forall (?s - switch) 
            (switch_on ?s)
        )
    ))
)
