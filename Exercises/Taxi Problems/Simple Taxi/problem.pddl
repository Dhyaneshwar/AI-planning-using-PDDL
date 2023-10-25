(define (problem taxi1)
   (:domain taxi_simplest)
   (:objects
         taxi_1 - taxi
         livingstone_tower royal_college graham_hills tic barony_hall - location
         scott rajesh lingjie - customer
        )
    (:init
        (outside_taxi scott)
        (customer_location scott livingstone_tower)

        (outside_taxi rajesh)
        (customer_location rajesh graham_hills)

        (outside_taxi lingjie)
        (customer_location lingjie barony_hall)
        
        (taxi_avaliable taxi_1)
        (taxi_location taxi_1 tic)
        
        (connects royal_college graham_hills)
        (connects graham_hills tic)
        (connects tic barony_hall)
        (connects barony_hall livingstone_tower)
        (connects livingstone_tower royal_college)
    )

    (:goal
        (and
            (outside_taxi scott)
            (outside_taxi rajesh)
            (outside_taxi lingjie)
            (customer_location scott graham_hills)
            (customer_location rajesh barony_hall)
            (customer_location lingjie livingstone_tower)
        )
    )
)