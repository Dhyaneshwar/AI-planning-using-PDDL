(define (domain tricky_switch_1)

    (:requirements :strips :typing :fluents :negative-preconditions :disjunctive-preconditions)

    (:types 
        switch 
        quantity
    )

    (:predicates 
        (on ?sA - switch)
        (off ?sA - switch)
        (side_switch ?sA - switch)
        (neighbor ?main ?right - switch)
        (switches_num ?num - quantity)
        (plus1 ?num1 ?num2 - quantity)
    )

    (:action switch_on
        :parameters (
            ?main ?neighbor1 ?neighbor2 - switch
            ?c ?c_plus_1 - quantity
        )
        :precondition (and
            (off ?main)
            (neighbor ?main ?neighbor1)
            (neighbor ?main ?neighbor2)
            (switches_num ?c)
            (plus1 ?c ?c_plus_1)
            (or
                (and
                    (on ?neighbor1)
                    (off ?neighbor2)                
                )
                (and
                    (on ?neighbor2)
                    (off ?neighbor1)                
                )
            )
         )
        :effect (and 
            (not(off ?main))
            (on ?main)
            (not(switches_num ?c))
            (switches_num ?c_plus_1)
        )
    )

    (:action side_switch_on
        :parameters (
            ?main ?side - switch
            ?c ?c_plus_1 - quantity
        )
        :precondition (and 
            (side_switch ?main)
            (neighbor ?main ?side)
            (plus1 ?c ?c_plus_1)
            (switches_num ?c)
            (on ?side)
            (off ?main)
        )
        :effect (and 
            (not(switches_num ?c))
            (switches_num ?c_plus_1)
            (on ?main)
            (not(off ?main))
        )
    )
    
    (:action switch_off
        :parameters (?sA - switch ?c ?c_plus_1 - quantity)
        :precondition (and 
            (on ?sA)
            (plus1 ?c ?c_plus_1)
            (switches_num ?c_plus_1)
        )
        :effect (and 
            (not(on ?sA))
            (off ?sA)
            (not(switches_num ?c_plus_1))
            (switches_num ?c)
        )
    )
    
)