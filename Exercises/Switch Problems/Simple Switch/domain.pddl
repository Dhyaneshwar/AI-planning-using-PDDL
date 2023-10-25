(define (domain switch_toggle)

    (:requirements :strips :negative-preconditions :typing)

    (:types
        switch
    )

    (:predicates
        (switch_on ?s - switch)
    )

    (:action on_switch
        :parameters (?s -switch)
        :precondition (and
            (not(switch_on ?s))
        )
        :effect (and 
            (switch_on ?s)
        )
    )
    
)