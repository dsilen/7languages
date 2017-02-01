; Use refs to create a vector of accounts in memory.
; Create debit and credit functions to change
; the balance of an account.

(def accounts (ref []))

(defn add-account [name]
    (dosync
        (alter accounts conj (ref {:name name :balance 0}))))

(defn debit [name amount]
    (dosync
        (let [account (first (filter (fn [x] (= (:name @x) name)) @accounts))]
            @account
        )))
