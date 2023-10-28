(define (domain taxi_fuel)

    (:requirements :strips :typing :negative-preconditions :fluents :durative-actions)

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
        (drive_time ?l1 ?l2 - location)
    )

    (:durative-action pick_up
        :parameters (?t - taxi ?c - customer ?l - location)
        :duration (= ?duration 1)
        :condition (and 
            (at start  (taxi_empty ?t))
            (at start (outside_taxi ?c))
            (over all  (taxi_location ?t ?l))
            (over all (customer_location ?c ?l))
        )
        :effect (and 
            (at start (not(taxi_empty ?t)))
            (at start (not(outside_taxi ?c)))
            (at end (inside_taxi ?c ?t))
            (at end (taxi_full ?t))
            (at end (not(customer_location ?c ?l)))
        )
    )

    (:durative-action drop
        :parameters (?t - taxi ?c - customer ?l - location)
        :duration (= ?duration 2)
        :condition (and 
            (at start (taxi_full ?t))
            (at start (inside_taxi ?c ?t))
            (over all (taxi_location ?t ?l))
        )
        :effect (and 
            (at start (not(taxi_full ?t)))
            (at start (not(inside_taxi ?c ?t)))
            (at end (taxi_empty ?t))
            (at end (outside_taxi ?c))
            (at end (customer_location ?c ?l))
        )
    )
    
    (:durative-action travel
        :parameters (?t - taxi ?from ?to - location)
        :duration (= ?duration (drive_time ?from ?to))
        :condition (and 
            (at start (taxi_location ?t ?from))
            (over all (connects ?from ?to))
            (over all (>= (fuel_level ?t) (fuel_cost ?from ?to)))
        )
        :effect (and 
            (at start (not(taxi_location ?t ?from)))
            (at end (taxi_location ?t ?to))
            (at end (decrease (fuel_level ?t) (fuel_cost ?from ?to)))
        )
    )

    (:durative-action refill
        :parameters (?t - taxi ?l - location)
        :duration (= ?duration 4)
        :condition (and 
            (at start (<=(fuel_level ?t) 20))
            (over all (fuel_station ?l))
            (over all (taxi_location ?t ?l))
        )
        :effect (and 
            (at end (assign (fuel_level ?t) 20))
        )
    )
    
)