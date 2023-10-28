(define (problem taxi3)
   (:domain taxi_fuel)
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
        
        (taxi_empty taxi_1)
        (taxi_location taxi_1 tic)

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

        (= (fuel_level taxi_1) 20)

        ;; Fuel Cost Between locations
        (= (fuel_cost royal_college graham_hills) 8)
        (= (fuel_cost royal_college tic) 8)
        (= (fuel_cost royal_college barony_hall) 7)
        (= (fuel_cost royal_college livingstone_tower) 5)

        (= (fuel_cost graham_hills royal_college) 8)
        (= (fuel_cost graham_hills tic) 3)
        (= (fuel_cost graham_hills barony_hall) 6)
        (= (fuel_cost graham_hills livingstone_tower) 12)

        (= (fuel_cost tic royal_college) 8)
        (= (fuel_cost tic graham_hills) 3)
        (= (fuel_cost tic barony_hall) 6)
        (= (fuel_cost tic livingstone_tower) 9)

        (= (fuel_cost barony_hall royal_college) 7)
        (= (fuel_cost barony_hall graham_hills) 6)
        (= (fuel_cost barony_hall tic) 6)
        (= (fuel_cost barony_hall livingstone_tower) 5)

        (= (fuel_cost livingstone_tower royal_college) 5)
        (= (fuel_cost livingstone_tower graham_hills) 12)
        (= (fuel_cost livingstone_tower tic) 9)
        (= (fuel_cost livingstone_tower barony_hall) 5)

        ;; Drive time between locations
        (= (drive_time royal_college graham_hills) 4)
        (= (drive_time royal_college tic) 25)
        (= (drive_time royal_college barony_hall) 27)
        (= (drive_time royal_college livingstone_tower) 15)

        (= (drive_time graham_hills royal_college) 14)
        (= (drive_time graham_hills tic) 5)
        (= (drive_time graham_hills barony_hall) 18)
        (= (drive_time graham_hills livingstone_tower) 38)

        (= (drive_time tic royal_college) 20)
        (= (drive_time tic graham_hills) 3)
        (= (drive_time tic barony_hall) 8)
        (= (drive_time tic livingstone_tower) 18)

        (= (drive_time barony_hall royal_college) 18)
        (= (drive_time barony_hall graham_hills) 15)
        (= (drive_time barony_hall tic) 12)
        (= (drive_time barony_hall livingstone_tower) 7)

        (= (drive_time livingstone_tower royal_college) 9)
        (= (drive_time livingstone_tower graham_hills) 30)
        (= (drive_time livingstone_tower tic) 23)
        (= (drive_time livingstone_tower barony_hall) 7)

        (fuel_station barony_hall)
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