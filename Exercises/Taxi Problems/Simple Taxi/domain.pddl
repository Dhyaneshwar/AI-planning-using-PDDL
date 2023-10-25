(define (domain taxi_simplest)

    (:requirements :strips :typing :negative-preconditions)

    (:types
        taxi location customer
    )

    (:predicates
        (outside_taxi ?c - customer)
        (connects ?l1 ?l2 - location)
        (customer_location ?c - customer ?l - location)
        (taxi_avaliable ?t - taxi)
        (taxi_location ?t - taxi ?l - location)
    )

    (:action pick_up
        :parameters (?t - taxi ?c - customer ?l - location)
        :precondition (and 
            (taxi_avaliable ?t)
            (outside_taxi ?c)
            (taxi_location ?t ?l)
            (customer_location ?c ?l)
        )
        :effect (and 
            (not(taxi_avaliable ?t))
            (not(outside_taxi ?c))
            (not(customer_location ?c ?l))
        )
    )

    (:action drop
        :parameters (?t - taxi ?c - customer ?prev ?curr - location)
        :precondition (and 
            (not(taxi_avaliable ?t))
            (not(outside_taxi ?c))
            (connects ?prev ?curr)
            (taxi_location ?t ?curr)
        )
        :effect (and 
            (taxi_avaliable ?t)
            (outside_taxi ?c)
            (customer_location ?c ?curr)
        )
    )
    
    (:action travel
        :parameters (?t - taxi ?from ?to - location)
        :precondition (and 
            (taxi_location ?t ?from)
            (connects ?from ?to)
        )
        :effect (and 
            (taxi_location ?t ?to)
            (not(taxi_location ?t ?from))
        )
    )
    
)