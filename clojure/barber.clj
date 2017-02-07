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


(def barberchair (ref nil))

(def waitchairs (ref {:chairs [] :max 3}))


(defn incrementCounter [c]
    (swap! c (fn [x] (+ x 1))))

(defn sleepInterval
    "Let the current thread sleep a random amount of msec between min and max (inclusive)."
    [min max]
    (let [interval (+ min (rand-int (+ 1 (- max min))))]
        (Thread/sleep interval)
        interval))

; add-watch ska vi använda med barbern


; Customer stuff
(def customerCounter (atom 0))

(defn getCustomerName []
    (let [customerId (incrementCounter customerCounter)]
        (str "Customer #" customerId)))


; Customer dispatchern
(def customer-dispatcher (agent nil))

(defn addCustomerToWaitchairIfAvailable [chairs customer]
    (do
    (let [
        l (:chairs chairs)
        c (:max chairs)]
    (if (< (count l) c) ; den får nil ibland på c ?!
        (assoc chairs :chairs (conj l customer))
        chairs))))


(defn do-dispatch [_]
    (loop []
        (if @stop?
            nil
            (do
                (sleepInterval 10 30)
                (dosync (alter waitchairs addCustomerToWaitchairIfAvailable (getCustomerName)))
                (recur)))))

(send customer-dispatcher do-dispatch)

; chairwatcher
(add-watch waitchairs :key (fn [k r ov nv]
    (if (first nv) ; om finns nån där
        (do
            (moveToBarberChair)
            (wakeBarber)))))

(defn moveToBarberChair []
    (dosync
        (alter chairs)))


; barber
(def barber (agent nil))

(defn do-barb [_]
    (loop []
    (if @stop?
        nil
        (do
            (Thread/sleep 20)

            (recur)))))

(send barber do-barb)

