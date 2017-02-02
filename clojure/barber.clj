;In this section, I’m going to outline a single problem called sleeping barber. It was created by Edsger Dijkstra in 1965. It has these characteristics:

;A barber shop takes customers.
;Customers arrive at random intervals, from ten to thirty milliseconds.
;The barber shop has three chairs in the waiting room.
;The barber shop has one barber and one barber chair.
;When the barber’s chair is empty, a customer sits in the chair, wakes up the barber, and gets a haircut.
;If the chairs are occupied, all new customers will turn away.
;Haircuts take twenty milliseconds.
;After a customer receives a haircut, he gets up and leaves.

;Write a multithreaded program to determine how many haircuts a barber can give in ten seconds.

(def stop? (ref false))

(defn dostop [] (dosync (ref-set stop? true)))

(def barber (agent nil))

(def barberchair (ref nil))

(def waitchairs (ref {:seats [] :free 3}))

; Customer dispatcher
(def customer-dispatcher (agent nil))

(defn do-dispatch [state]
    (loop []
        (if @stop?
            nil
            (do
                (Thread/sleep 2000)
                (println "hej")
                (recur))
        )))

(send customer-dispatcher do-dispatch)
