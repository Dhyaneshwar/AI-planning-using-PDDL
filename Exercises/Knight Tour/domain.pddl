(define (domain knights-tour)
  (:requirements :negative-preconditions)

  (:predicates
    (at ?col ?row)
    (visited ?col ?row)
    (diff_by_one ?x ?y)
    (diff_by_two ?x ?y)
   )

  ; Action move_2col_1row moves the Knight two steps along the horizontal
  ; axis (changing the column by 2) and one step along the vertical axis
  ; (changing the row by 1), while action move_2row_1col below does the
  ; opposite.
  

  (:action move_2col_1row
   :parameters (?from_col ?from_row ?to_col ?to_row)
   :precondition (and (at ?from_col ?from_row)
		      (diff_by_two ?from_col ?to_col) ; col +/- 2
		      (diff_by_one ?from_row ?to_row) ; row +/- 1
		      (not (visited ?to_col ?to_row)))
   :effect (and (not (at ?from_col ?from_row))
		(at ?to_col ?to_row)
		(visited ?to_col ?to_row))
   )

  (:action move_2row_1col
   :parameters (?from_col ?from_row ?to_col ?to_row)
   :precondition (and (at ?from_col ?from_row)
		      (diff_by_two ?from_row ?to_row) ; row +/- 2
		      (diff_by_one ?from_col ?to_col) ; col +/- 1
		      (not (visited ?to_col ?to_row)))
   :effect (and (not (at ?from_col ?from_row))
		(at ?to_col ?to_row)
		(visited ?to_col ?to_row))
   )

  )
