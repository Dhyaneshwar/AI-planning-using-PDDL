(define (domain taxi_fuel)

    (:requirements :strips :typing :negative-preconditions :fluents)

    (:types
        taxi location customer
    )

    (:predicates
        (inside_taxi ?c - customer ?t - taxi)
        (outside_taxi ?c - customer)
        (connects ?l1 ?l2 - location)
        (customer_location ?c - customer ?l - location)
        (taxi_empty ?t - taxi)
        (taxi_full ?t - taxi)
        (taxi_location ?t - taxi ?l - location)
        (fuel_station ?l - location)
    )

    (:functions
        (fuel_level ?t - taxi)
        (fuel_cost ?l1 ?l2 - location)
    )

    (:action pick_up
        :parameters (?t - taxi ?c - customer ?l - location)
        :precondition (and 
            (taxi_empty ?t)
            (outside_taxi ?c)
            (taxi_location ?t ?l)
            (customer_location ?c ?l)
        )
        :effect (and 
            (taxi_full ?t)
            (not(taxi_empty ?t))
            (inside_taxi ?c ?t)
            (not(outside_taxi ?c))
            (not(customer_location ?c ?l))
        )
    )

    (:action drop
        :parameters (?t - taxi ?c - customer ?l - location)
        :precondition (and 
            (taxi_full ?t)
            (inside_taxi ?c ?t)
            (taxi_location ?t ?l)
        )
        :effect (and 
            (taxi_empty ?t)
            (not(taxi_full ?t))
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
            (>= (fuel_level ?t) (fuel_cost ?from ?to))
        )
        :effect (and 
            (taxi_location ?t ?to)
            (not(taxi_location ?t ?from))
            (decrease (fuel_level ?t) (fuel_cost ?from ?to))
        )
    )

    (:action refill
        :parameters (?t - taxi ?l - location)
        :precondition (and 
            (<=(fuel_level ?t) 20)
            (fuel_station ?l)
            (taxi_location ?t ?l)
        )
        :effect (and 
            (assign (fuel_level ?t) 20)
        )
    )
    
)