(ns log-levels
  (:require [clojure.string :as str]))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (-> s
    (str/replace #"^\[[A-Z]+\]\:" "")
    str/trim
    )
  )

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (str/lower-case (str/replace (get (str/split s #"\]") 0) "[" ""))
  )

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (str/join [(message s), " (", (log-level s), ")"])
  )
