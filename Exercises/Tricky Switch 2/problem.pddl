(define (problem tricky_switch_prob) 
    
    (:domain tricky_switch_1)
    (:objects 
        s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - switch
        n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - quantity
    )

    (:init
        (on s1)
        (off s2)
        (on s3)
        (off s4)
        (off s5)
        (on s6)
        (off s7)
        (off s8)
        (on s9)
        (off s10)
        
        (switches_num n4)

        (plus1 n1 n2)
        (plus1 n2 n3)
        (plus1 n3 n4)
        (plus1 n4 n5)
        (plus1 n5 n6)
        (plus1 n6 n7)
        (plus1 n7 n8)
        (plus1 n8 n9)
        (plus1 n9 n10)

        (neighbor s1 s2)
        (neighbor s2 s1)
        (neighbor s2 s3)
        (neighbor s3 s2)
        (neighbor s3 s4)
        (neighbor s4 s3)
        (neighbor s4 s5)
        (neighbor s5 s4)
        (neighbor s5 s6)
        (neighbor s6 s5)
        (neighbor s6 s7)
        (neighbor s7 s6)
        (neighbor s7 s8)
        (neighbor s8 s7)
        (neighbor s8 s9)
        (neighbor s9 s8)
        (neighbor s9 s10)
        (neighbor s10 s9)

        (side_switch s1)
        (side_switch s10)
    )

    (:goal (and
        (switches_num n1)
    ))
)