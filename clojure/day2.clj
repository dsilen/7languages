; Implement an unless with an else condition using macros.

(defmacro unless [test doif doelse]
    (list 'if (list 'not test) doif doelse))

(defmacro unless [test & rest]
    (concat (list 'if (list 'not test)) rest))

;(macroexpand '(unless true 1 2))

; Write a type using defrecord that implements a protocol.
(defprotocol IPerson
    (name [this])
    (hobbies [this])
    (sethobbies [this nyhobby]))

(defrecord Person [name hobbies] IPerson
    (name [this] (:name this))
    (hobbies [this] (:hobbies this))
    (sethobbies [this nyhobby] (Person. (:name this) nyhobby)))

(def kk (Person. "kalle kula" "äta glass"))
(name kk)
(def kk2 (sethobbies kk "åka båt"))
(hobbies kk2)
