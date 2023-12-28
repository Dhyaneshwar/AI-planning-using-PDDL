(define (domain taxi_capacity)

    (:requirements :strips :typing :negative-preconditions)

    (:types
        taxi location customer
    )

    (:predicates
        (inside_taxi ?c - customer ?t - taxi)
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
            (inside_taxi ?c ?t)
            (not(customer_location ?c ?l))
        )
    )

    (:action drop
        :parameters (?t - taxi ?c - customer ?l - location)
        :precondition (and 
            (not(taxi_avaliable ?t))
            (inside_taxi ?c ?t)
            (taxi_location ?t ?l)
        )
        :effect (and 
            (taxi_avaliable ?t)
            (outside_taxi ?c)
            (not(inside_taxi ?c ?t))
            (customer_location ?c ?l)
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