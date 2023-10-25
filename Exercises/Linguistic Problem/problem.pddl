;; Example problem for hte first formulation of the linehaul domain
;; (with types, without costs), from Chapter 2.
;; VAL@github syntax checker: no errors, no warnings.

(define (problem linehaul-example)
  (:domain linehaul_without_costs)

  (:objects
    ADoubleRef - refrigerated_truck
    BDouble - truck
    depot GV E BW - location
    ;; Declare objects for integers, up to the largest quantity
    ;; that appears in the problem:
    n0 n1 n2 n3 n4 n5 n6 n7 n8 n9
    n10 n11 n12 n13 n14 n15 n16 n17 n18 n19
    n20 n21 n22 n23 n24 n25 n26 n27 n28 n29
    n30 n31 n32 n33 n34 n35 n36 n37 n38 n39
    n40 - quantity
    )

  (:init
    (at ADoubleRef depot)
    (at BDouble depot)
    (free_capacity ADoubleRef n40)
    (free_capacity BDouble n34)
    (demand_chilled_goods GV n18)
    (demand_ambient_goods GV n12)
    (demand_chilled_goods E n7)
    (demand_ambient_goods E n2)
    (demand_chilled_goods BW n3)
    (demand_ambient_goods BW n0)
    (plus1 n0 n1)
    (plus1 n1 n2)
    (plus1 n2 n3)
    (plus1 n3 n4)
    (plus1 n4 n5)
    (plus1 n5 n6)
    (plus1 n6 n7)
    (plus1 n7 n8)
    (plus1 n8 n9)
    (plus1 n9 n10)
    (plus1 n10 n11)
    (plus1 n11 n12)
    (plus1 n12 n13)
    (plus1 n13 n14)
    (plus1 n14 n15)
    (plus1 n15 n16)
    (plus1 n16 n17)
    (plus1 n17 n18)
    (plus1 n18 n19)
    (plus1 n19 n20)
    (plus1 n20 n21)
    (plus1 n21 n22)
    (plus1 n22 n23)
    (plus1 n23 n24)
    (plus1 n24 n25)
    (plus1 n25 n26)
    (plus1 n26 n27)
    (plus1 n27 n28)
    (plus1 n28 n29)
    (plus1 n29 n30)
    (plus1 n30 n31)
    (plus1 n31 n32)
    (plus1 n32 n33)
    (plus1 n33 n34)
    (plus1 n34 n35)
    (plus1 n35 n36)
    (plus1 n36 n37)
    (plus1 n37 n38)
    (plus1 n38 n39)
    (plus1 n39 n40)
    )

  (:goal (and (demand_chilled_goods GV n0)
              (demand_ambient_goods GV n0)
              (demand_chilled_goods E n0)
              (demand_ambient_goods E n0)
              (demand_chilled_goods BW n0)
              (demand_ambient_goods BW n0)
              (at ADoubleRef depot)
              (at BDouble depot))
	 )
  )
