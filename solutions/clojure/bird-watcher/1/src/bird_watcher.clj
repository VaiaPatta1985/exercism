(ns bird-watcher)

(def last-week 
  [0 2 5 3 7 8 4]
  )

(defn today [birds]
  (get birds (- (count birds) 1))
  )

(defn inc-bird [birds]
  (assoc birds (- (count birds) 1) (+ (today birds) 1))
  )

(defn product [my-vector]
  (cond (== (count my-vector) 1) (get my-vector 0)
        :else (* (today my-vector) (product (subvec my-vector 0 (- (count my-vector) 1))))
    )
  )

(defn sum [my-vector]
  (cond (== (count my-vector) 1) (get my-vector 0)
        :else (+ (today my-vector) (sum (subvec my-vector 0 (- (count my-vector) 1))))
    )
  )

(defn day-without-birds? [birds]
    (== (product birds) 0)
  )

(defn n-days-count [birds n]
  (sum (subvec birds (- (count birds) 7) (+ (- (count birds) 7) n)))
  )

(defn busy-days [birds]
  (cond (> (count birds) 1) (cond (> (today birds) 4) (+ 1 (busy-days (subvec birds 0 (- (count birds) 1))))
                              :else (busy-days (subvec birds 0 (- (count birds) 1)))
                              )
    :else (cond (> (get birds 0) 4) 1
            :else 0)
    )
  )

(defn odd-week? [birds]
  (cond (== 1 (count birds)) (< (get birds 0) 2)
        :else (cond (== (today birds) 1) (cond (== (get birds (- (count birds) 2)) 0)
              (odd-week? (subvec birds 0 (- (count birds) 1)))
            :else false
        )
                    (== (today birds) 0) (cond (== (get birds (- (count birds) 2)) 1)
              (odd-week? (subvec birds 0 (- (count birds) 1)))
            :else false
        )
                    :else false
                )
    )
  )
