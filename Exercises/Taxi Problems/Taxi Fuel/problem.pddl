(define (problem taxi3)
   (:domain taxi_fuel)
   (:objects
         taxi_1 taxi_2 taxi_3 - taxi
         livingstone_tower royal_college graham_hills tic barony_hall - location
         scott rajesh lingjie yan misbah stuart - customer
        )
    (:init
        (outside_taxi scott)
        (customer_location scott livingstone_tower)

        (outside_taxi rajesh)
        (customer_location rajesh graham_hills)

        (outside_taxi lingjie)
        (customer_location lingjie barony_hall)

        (outside_taxi misbah)
        (customer_location misbah graham_hills)

        (outside_taxi yan)
        (customer_location yan royal_college)

        (outside_taxi stuart)
        (customer_location stuart tic)
        
        (taxi_avaliable taxi_1)
        (taxi_location taxi_1 tic)

        (taxi_avaliable taxi_2)
        (taxi_location taxi_2 tic)
        
        (taxi_avaliable taxi_3)
        (taxi_location taxi_3 tic)

        (connects livingstone_tower royal_college)
        (connects royal_college graham_hills)
        (connects graham_hills tic)
        (connects tic barony_hall)
        (connects barony_hall livingstone_tower)

        (connects royal_college livingstone_tower)
        (connects graham_hills royal_college)
        (connects tic graham_hills)
        (connects barony_hall tic)
        (connects livingstone_tower barony_hall)
    )

    (:goal
        (and
            (outside_taxi scott)
            (outside_taxi rajesh)
            (outside_taxi lingjie)
            (outside_taxi misbah)
            (outside_taxi yan)
            (outside_taxi stuart)

            (customer_location scott graham_hills)
            (customer_location rajesh barony_hall)
            (customer_location lingjie livingstone_tower)
            (customer_location yan tic)
            (customer_location misbah barony_hall )
            (customer_location stuart livingstone_tower)
        )
    )
)