(define (problem tricky_switch_prob) 
    
    (:domain tricky_switch_1)
    (:objects 
        s1 s2 s3 s4 s5 s6 s7 s8 s9 s10 - switch
        s0 - dummy_switch
    )

    (:init
        (switch_on s1)
        (switch_on s3)
        (switch_on s6)
        (switch_on s9)
        
        (isNotSwitch s0)

        (neighbor s0 s1 s2)
        (neighbor s2 s1 s0)
        (neighbor s1 s2 s3)
        (neighbor s3 s2 s1)
        (neighbor s2 s3 s4)
        (neighbor s4 s3 s2)
        (neighbor s3 s4 s5)
        (neighbor s5 s4 s3)
        (neighbor s4 s5 s6)
        (neighbor s6 s5 s4)
        (neighbor s5 s6 s7)
        (neighbor s7 s6 s5)
        (neighbor s6 s7 s8)
        (neighbor s8 s7 s6)
        (neighbor s7 s8 s9)
        (neighbor s9 s8 s7)
        (neighbor s8 s9 s10)
        (neighbor s10 s9 s8)
        (neighbor s9 s10 s0)
        (neighbor s0 s10 s9)
    )

    (:goal (and
        (forall (?s - switch) 
            (switch_on ?s)
        )
    ))
)
