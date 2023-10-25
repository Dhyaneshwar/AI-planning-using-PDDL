(define (domain tricky_switch_1)

    (:requirements :strips :typing :fluents :negative-preconditions :disjunctive-preconditions)

    (:types 
        switch 
        dummy_switch
    )

    (:predicates 
        (switch_on ?sA)
        (neighbor ?left ?main ?right)
        (isNotSwitch ?sA)
    )

    (:action switch_on_action
        :parameters (?left ?main ?right)
        :precondition (and        
            (neighbor ?left ?main ?right)
            (not (switch_on ?main))
            (or 
                (and
                    (and 
                        (not (isNotSwitch ?left))
                        (not (isNotSwitch ?right))
                    )
                    (not(and
                        (switch_on ?left)
                        (switch_on ?right)
                    ))
                    (or
                        (switch_on ?left)
                        (switch_on ?right)
                    )
                )
                (and
                    (isNotSwitch ?left)
                    (switch_on ?right)
                )
                (and
                    (isNotSwitch ?right)
                    (switch_on ?left)
                )
            )
        )
        :effect (and 
            (switch_on ?main)
        )
    )
    
    (:action switch_off_action
        :parameters (?sA)
        :precondition (and 
            (not(isNotSwitch ?sA))
            (switch_on ?sA)
        )
        :effect (and 
            (not (switch_on ?sA))
        )
    )

)