; Hitta exempel med sequences
; https://clojuredocs.org/clojure.core/seq

; Hitta formal definition functions
; https://clojuredocs.org/clojure.core/defn

; Script snabbt starta repl
; lein repl


(defn big
    "returns true if a string st is longer than n characters"
    [st n]
    (> (count st) n))

; (big "abc" 2)
; (big "abc" 3)

(defn collection-type 
    "Visar vad för collection det är"
    [col]
    (let [test [(list? col) (map? col) (vector? col)]]
        (case test
            [true false false] :list
            [false true false] :map
            [false false true] :vector
            :unknown)))

; (collection-type '())
; (collection-type {})
; (collection-type [])
; (collection-type #{})

