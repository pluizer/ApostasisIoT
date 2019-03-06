;; Sets the key and password to use in the Apostasis Framework
(defvar *key* "button")
(defvar *password* "1234567")
;; Sets the pin the where the button is connected to on the Arduino
(defvar *button-pin* 5)

;; Sets the button pin to be an input
(pinmode *button-pin* nil)

;; Aux function for toggle-and-set
(defun -toggle (v)
  (if (eq v 1) 0 1))

;; Switches the value of "button" between 0 and 1
(defun toggle-and-set (v key password)
  (set-value *key* (-toggle v) *password*))

;; Keep running this loop
(defun main-loop ()
  ;; Wait a tenth of a second
  (delay 100)
  ;; When button is pressed toggle the "button" value on the
  ;; Apostasis Framework
  (when (digitalread *button-pin*)
    (read-value *key* toggle-and-set))
  (main-loop))
