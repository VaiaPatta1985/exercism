(ns cars-assemble)

(defn production-rate
  "Returns the assembly line's production rate per hour,
   taking into account its success rate"
  [speed]
  (* speed (double 221.0) (cond (== speed 0) 0
                                (== speed 9) 0.8
                                (>= speed 10) 0.77
                                (<= speed 4) 1
                                :else 0.9
                            )
    )
  )

(defn working-items
  "Calculates how many working cars are produced per minute"
  [speed]
  (int (/ (production-rate speed) 60.0))
  )
