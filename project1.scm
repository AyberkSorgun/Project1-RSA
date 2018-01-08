;;; asorgun14@ku.edu.tr     Wed Oct 19 12:48:37 2016
;;;         		 	
;;; Comp200 Project 1         		 	
;;;         		 	
;;; Before you start:         		 	
;;;         		 	
;;; * Please read the detailed instructions for this project from the
;;; file project1.pdf available on the course website.
;;;         		 	
;;; * Please read "Project Submission Instructions" carefully and make
;;; sure you understand everything before you start working on your
;;; project in order to avoid problems.
;;;         		 	
;;; While you are working:         		 	
;;; * Type all your work and notes in the appropriate sections of this file.
;;; * Please do not delete any of the existing lines.
;;; * Use the procedure names given in the instructions.
;;; * Remember to frequently save your file.
;;; * Use semicolon (;) to comment out text, tests and unused code.
;;; * Remember to document your code.
;;; * Remember our collaboration policy: you can discuss with your friends but:
;;;         		 	
;;;   *** NOTHING WRITTEN GETS EXCHANGED ***
;;;         		 	
;;; When you are done:         		 	
         		 	
;;; * Perform a final save and submit your work following the instructions.
;;; * Please do not make any modifications after midnight on the due date.
;;; * Please send an email comp200@ku.edu.tr if you have any questions.
;;; * Make sure your file loads without errors:
;;;         		 	
;;; *** IF LOADING GIVES ERRORS YOUR PROJECT WILL NOT BE GRADED ***
;;;         		 	
;;; Before the definition of each procedure, please write a description
;;; about what the procedure does and what its input and output should
;;; be, making sure the lines are commented out with semi-colons.
         		 	
;;; These two lines are necessary, please do not delete:
#lang sicp
(#%require (only racket/base random))
(define your-answer-here -1)         		 	
         		 	
         		 	
;;;;;;;::;;;;::::;;::::;:::::::;;:;::;;::::::;:;:::;:::;;::;;;:;::;:;;;::;:;;;:::;;:
;;; Problem 1: Modular Arithmetic
         		 	
;; (modulo 13 8) ; ->  ?         		 	
;; (remainder 13 8) ; ->  ?         		 	
;; (modulo -13 8) ; ->  ?         		 	
;; (remainder -13 8) ; ->  ?         		 	
;; (modulo -13 -8) ; ->  ?         		 	
;; (remainder -13 -8) ; ->  ?         		 	
         		 	
;;; What is the difference between remainder and modulo? Which one is
;;; the best choice for implementng modular arithmetic as described in
;;; project pdf?  Include your test results and your answers to these
;;; questions in a comment in your solution.
         		 	
;For positive values, there is no difference between modulo and remainder, but in general
;modulo returns the value of given number in in mod x in interval [0,x-1] such that (-8 mod13)
;(modulo -8 13) returns 5. Remainder returns -8 (remainder -8 13). For RSA modular arithmetic,
;modulo is better choise. We want to  encrypted  message have a value in [0,n-1].         		 	




  
;;; Description for +mod         		 	
         		 	
(define +mod         		 	
  (lambda (a b n)         		 	
(modulo (+ a b)n)         		 	
))         		 	
         		 	
;;; Description for -mod         		 	
         		 	
(define -mod         		 	
  (lambda (a b n)         		 	
(modulo (- a b)n)         		 	
))         		 	
         		 	
;;; Description for *mod         		 	
         		 	
(define *mod         		 	
  (lambda (a b n)         		 	
(modulo (* a b)n)         		 	
))


         		 	
         		 	
; After the definition of each procedure, please cut and paste some
; test cases you have run, making sure the lines are commented out
; with semi-colons:         		 	
         		 	
; Test cases         		 	
         		 	
;; (+mod 7 5 8) ; -> 4         		 	
;; (+mod 10 10 3) ; -> 2         		 	
;; (-mod 5 12 2) ; -> 1         		 	
;; (*mod 6 6 9) ; -> 0         		 	
;; (+mod 99 99 100) ; ->   ?         		 	
;; (*mod 50 -3 100) ; ->   ?         		 	
         		 	
         		 	
;;;;;;;::;;;;::::;;::::;:::::::;;:;::;;::::::;:;:::;:::;;::;;;:;::;:;;;::;:;:;::;;;;
;;; Problem 2: Raising a Number to a Power
         		 	
;; What is the order of growth in time of slow-exptmod?
;The order of growth in time of slow-exptmod is O(n).
;Because every time we increase a or b, there is a constan increase in number of operation.

        		 	
         		 	
;; What is its order of growth in space?
;The order of growth in space of slow-exptmod is O(n).               
;Because every time we increase b, there is a constan increase in number of operation.
        		 	
         		 	
;; Does slow-exptmod use an iterative algorithm or a recursive algorithm?
;Slow-exptmod uses a recursive algorithm.       		 	
         		 	
;;; Description for exptmod         		 	
         		 	
(define exptmod         		 	
  (lambda (a b n)
    (cond
      ((= b 0) 1)
      ((= (modulo b 2) 0) (exptmod (*mod a a n) (/ b 2) n))
      (else (*mod a (exptmod a (- b 1) n) n)))))         		 	


         		 	
; Test cases:         		 	
         		 	
;; (exptmod 2 0 10) ; -> 1         		 	
;; (exptmod 2 3 10) ; -> 8         		 	
;; (exptmod 3 4 10) ; -> 1         		 	
;; (exptmod 2 15 100) ; -> 68         		 	
;; (exptmod -5 3 100) ; -> 75         		 	
         		 	
;; What is the order of growth in time of exptmod?
; The growth in time is O(log n).        		 	
         		 	
;; What is its order of growth in space?
;The growth in space is O(n).                
      		 	
         		 	
;; Does exptmod use an iterative algorithm or a recursive algorithm?
;exptmod use a recursive algorithm.         		 	
         		 	
         		 	
;;;;;;;::;;;;::::;;::::;:::::::;;:;::;;::::::;:;:::;:::;;::;;;:;::;:;;;::;:;:;::;;;:
;;; Problem 3: Large Random Number
         		 	
;;; Examples of random         		 	
;; The results of random will be different for each run so you might not get the
;; below results.         		 	
;; (random 10) ; ->1         		 	
;; (random 10) ; ->6         		 	
;; (random 10) ; ->6         		 	
;; (random 10) ; ->0         		 	
;; (random 10) ; ->7         		 	
         		 	
;;; Description for random-k-digit-number:
         		 	
(define random-k-digit-number
  (lambda (n)
    (if (= n 1)(random 10)
	(let ((newnumber (- n 1)))
	  (+ (* (expt 10 newnumber) (random 10)) (random-k-digit-number (- n 1)))))))         		 	
         		 	
; Test cases:         		 	
         		 	
;; (random-k-digit-number 1) ; ->  ?  (1 digit)
;; (random-k-digit-number 3) ; ->  ?  (1-3 digits)
;; (random-k-digit-number 3) ; ->  ?  (is it different?)
;; (random-k-digit-number 50) ; ->  ?  (1-50 digits)
         		 	
;;; Description for count-digits
         		 	
(define count-digits         		 	
  (lambda (n)         		 	
(if ( <(/ n 10) 1) 1 (+ 1 (count-digits (/ n 10))))))         		 	
         		 	
; Test cases:         		 	
         		 	
;; (count-digits 3) ; -> 1         		 	
;; (count-digits 2007) ; -> 4         		 	
;; (count-digits 123456789) ; -> 9
         		 	
;;; Description for big-random         		 	
         		 	
(define big-random(lambda (n)(let ((test-number (random-k-digit-number (count-digits n))))
      (if (< test-number n) test-number (big-random n)))))         		 	
         		 	
; Test cases:         		 	
;; (big-random 100) ; ->  ?  (1-2 digit number)
;; (big-random 100) ; ->  ?  (is it different?)
;; (big-random 1) ; ->  0         		 	
;; (big-random 1) ; ->  0 (should be always 0)
;; (big-random (expt 10 40)) ; ->  ?  (roughly 40-digit number)
         		 	
         		 	
;;;;;;;::;;;;::::;;::::;:::::::;;:;::;;::::::;:;:::;:::;;::;;;:;::;:;;;::;:;:;::;;:;
;;; Problem 4: Prime Numbers         		 	
         		 	
;;; What is the order of growth in time of slow-prime? ?
;The growth in time of slow-prime is O(n).                        		 	
         		 	
;;; What is its order of growth in space?
;The growth in space of slow-prime is constant O(1).         		 	
         		 	
;;; Does slow-prime? use an iterative algorithm or a recursive algorithm?
;Slow-prime? use an iterative algorithm.                          		 	
         		 	
;;; We only have to check factors less than or equal to (sqrt n). How would this
;;; affect the order of growth in time?
;;; if we do not restrict the test integers with (sqrt n) then our function would take longer time.         		 	
         		 	
;;; We only have to check odd factors (and 2, as a special case). How would this
;;; affect the order of growth in time?
;The growth in time of slow-prime would still be same but it would take less time .         		 	
         		 	
;;; Test Fermat's Little Theorem
;; (big-random 23);
;   19
;  (exptmod 19 23 23);
;   19
;; > (modulo 19 23);
;   19                  same, so 19 is a prime.

;(big-random 19);
;17
;> (exptmod 17 19 19);
;   17     		 	
         		 	
;;; Description for prime?         		 	
         		 	
(define prime-test-iterations 20)
         		 	
(define prime?
  (lambda (p)
    (prime-faster? p prime-test-iterations)))

(define prime-faster?
  (lambda (n time)
    (cond ((= time 0) #t)
	  ((fermat-test n) (prime-faster? n (- time 1)))
	  (else #f))))

(define fermat-test
  (lambda (n)
    (define try-it
      (lambda (p)
	(= (exptmod p n n) p)))
    (cond ((= n 0) #f)
	  ((= n 1) #f)
	  (else
	   (try-it (big-random n))))))
         		 	
; Test cases:         		 	
;; (prime? 2) ; -> #t         		 	
;; (prime? 4) ; -> #f         		 	
;; (prime? 1) ; -> #f         		 	
;; (prime? 0) ; -> #f         		 	
;; (prime? 200) ; ->  ?         		 	
;; (prime? 199) ; ->  ?         		 	
         		 	
;;; What is the order of growth in time of your implementation of prime?
;Prime?'s order of growth in space is  O(log n).                           		 	
         		 	
;;; What is its order of growth in space? (take exptmod into account)
;Prime?'s order of growth in space is constant O(1).         		 	
         		 	
;;; Does prime? use an iterative algoritm or a recursive algorithm?
; prime? uses an iterative algoritm.         		 	
         		 	
         		 	
         		 	
;;;;;;;::;;;;::::;;::::;:::::::;;:;::;;::::::;:;:::;:::;;::;;;:;::;:;;;::;:;:;::;;::
;;; Problem 5: Random Primes         		 	
         		 	
;;; Description for random-prime:
         		 	
(define random-prime
  (lambda (n)
    (let ((x (big-random n))) 
      (if (prime? x) x (random-prime n)))))         		 	
         		 	
; Test cases:         		 	
;; (random-prime 3) ; -> 2         		 	
;; (random-prime 3) ; -> 2 (must be always 2)
;; (random-prime 100) ; ->  ?         		 	
;; (random-prime 100) ; ->  ?         		 	
;; (random-prime 100000) ; ->  ?
         		 	
         		 	
         		 	
;;;;;;;::;;;;::::;;::::;:::::::;;:;::;;::::::;:;:::;:::;;::;;;:;::;:;;;::;:;:;::;:;;
;;; Problem 6: Multiplicative Inverses
         		 	
;;; Description of ax+by=1         		 	
         		 	
(define ax+by=1(lambda (a b)
    (let ((quo (quotient a b))(rem (remainder a b)))
      (if (= rem 1)(list 1 (* quo -1))(let ((ans (ax+by=1 b rem )))
	    (list (cadr ans) (- (car ans) (* quo (cadr ans)))))))))

         		 	
; Test cases         		 	
;; (ax+by=1 17 13) ; -> (-3 4) 17*-3 + 13*4 = 1
;; (ax+by=1 7 3) ; -> (1 -2) 7*1 + 3*-2 =1
;; (ax+by=1 10 27) ; -> (-8 3) 10*-8 + 3*27 =1
         		 	
;;; Description of inverse-mod         		 	
         		 	
(define inverse-mod
  (lambda (a b)
    (if (not (= (gcd a b) 1))
	"error"
	(let ((ans (ax+by=1 a b)))
	  (let ((inverse (car ans)))
	    (if (< inverse 0)(+ inverse b)inverse))))))   		 	
         		 	
; Test cases:         		 	
;; (inverse-mod 5 11) ; ->9 5*9 = 45 = 1 (mod 11)
;; (inverse-mod 9 11) ; -> 5         		 	
;; (inverse-mod 7 11) ; -> 8 7*8 = 56 = 1 (mod 11)
;; (inverse-mod 8 12) ; -> error no inverse exists
;; (inverse-mod (random-prime 101) 101) -> (test your answer with *mod)  ?
         		 	
         		 	
         		 	
;;;;;;;::;;;;::::;;::::;:::::::;;:;::;;::::::;:;:::;:::;;::;;;:;::;:;;;::;:;:;::;:;:
;;; Problem 7: RSA                
                
;;; Description of random-keypair
(define (make-key exp mod)                
(cons exp mod)
  )                
                
(define (get-exponent key)                
(car key)               
  )                
(define (get-modulus key)                
(cdr key)                
  )                
                
(define random-keypair                
  (lambda (m)
    (let ((p (random-prime m)))
    (let ((q (random-prime m)))
      (define makeBigger (lambda (a b x)
                          (if (> (* (- a 1) (- b 1)) m)  
    (let ((modulus (* a b)))
     (define generate-E (lambda (n)
                         (define r (big-random n))(if (= (gcd r (* (- a 1) (- b 1))) 1) r (generate-E n))))
    (let ((e (generate-E modulus)))
    (let ((d (inverse-mod e (* (- a 1) (- b 1)))))
(list (make-key e modulus) (make-key d modulus))))) (makeBigger (random-prime x) (random-prime x) x))))
      (makeBigger p q m)))               
))                
                 
;;; Description of random-keypair
(define rsa                
  (lambda (key message)                
(exptmod message (car key) (cdr key))                
))                
                
; Test cases:                
;:: (random-keypair 10000)-> {{1186757 . 11905417} . {3293225 . 11905417}}
; (rsa (make-key 1186757 11905417) 247) -> 9192913
; (rsa (make-key 3293225 11905417) 9192913) -> 247
;:: (random-keypair 10000) -> {{1852151 . 25018823} . {22726151 . 25018823}
; (rsa (make-key 1852151 25018823) 10259) -> 19715114
; (rsa (make-key 22726151 25018823) 19715114) -> 10259
                
;;; What happend when you try to encrypt and decrypt a message integer
;;;which is too large for the key - i.e., larger than the modulus n?
; The program uses modulo of that message integer, which is smaller and corresponds to another string, giving the wrong message.                
                
;;; Description of encrypt:                
                
(define encrypt                
  (lambda (public-key string)                
(rsa public-key (string->integer string))                
))                
                
;;; Description of encrypt:                
                
(define decrypt                
  (lambda (private-key encrypted-message)
(integer->string (rsa private-key encrypted-message))                
))
         		 	
         		 	
;; Test cases:         		 	
;; (define key (random-keypair 10000000000000000000000000))
;; (define e1 (encrypt (car key) "hello Comp200!"))
;; (decrypt (cadr key) e1) ; -> "hello Comp200!"
         		 	
;; (define e2 (encrypt (car key) ""))
;; (decrypt (cadr key) e2) ; -> ""
         		 	
;; (define e3 (encrypt (car key) "This is fun!"))
;; (decrypt (cadr key) e3) ; -> "This is fun!"
         		 	
         		 	
;;;;;;;::;;;;::::;;::::;:::::::;;:;::;;::::::;:;:::;:::;;::;;;:;::;:;;;::;:;:;::;::;
;; Helper functions: you do not need to edit the functions given below.
         		 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         		 	
;; Problem 2: Raising a Number to a Power
;;         		 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
         		 	
(define slow-exptmod         		 	
  (lambda (a b n)         		 	
    (if (= b 0)         		 	
	1         		 	
	(*mod a (slow-exptmod a (- b 1) n) n))))
         		 	
         		 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         		 	
;; Problem 4: Prime Numbers         		 	
;;         		 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
         		 	
(define test-factors         		 	
  (lambda (n k)         		 	
    (cond ((>= k n) #t)         		 	
	  ((= (remainder n k) 0) #f)
	  (else (test-factors n (+ k 1))))))
         		 	
(define slow-prime?         		 	
  (lambda (n)         		 	
    (if (< n 2)         		 	
	#f         		 	
	(test-factors n 2))))         		 	
         		 	
         		 	
         		 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;         		 	
;; Problem 7: RSA         		 	
;;         		 	
;; Converting message strings to and from
;; integers.         		 	
;;         		 	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
         		 	
         		 	
(define (join-numbers list radix)
  ; Takes a list of numbers (i_0 i_1 i_2 ... i_k)
  ; and returns the number         		 	
  ;    n = i_0 + i_1*radix + i_2*radix2 + ... i_k*radix^k + radix^(k+1)
  ; The last term creates a leading 1, which allows us to distinguish
  ; between lists with trailing zeros.
  (if (null? list)         		 	
      1         		 	
      (+ (car list) (* radix (join-numbers (cdr list) radix)))))
         		 	
; test cases         		 	
;(join-numbers '(3 20 39 48) 100) ;-> 148392003
;(join-numbers '(5 2 3 5 1 9) 10) ;-> 1915325
;(join-numbers '() 10) ;-> 1         		 	
         		 	
         		 	
(define (split-number n radix)         		 	
  ; Inverse of join-numbers.  Takes a number n generated by
  ; join-numbers and converts it to a list (i_0 i_1 i_2 ... i_k) such
  ; that         		 	
  ;    n = i_0 + i_1*radix + i_2*radix2 + ... i_k*radix^k + radix^(k+1)
  (if (<= n 1)         		 	
      '()         		 	
      (cons (remainder n radix)
	    (split-number (quotient n radix) radix))))
         		 	
; test cases         		 	
;(split-number (join-numbers '(3 20 39 48) 100) 100) ;-> (3 20 39 48)
;(split-number (join-numbers '(5 2 3 5 1 9) 10) 10)  ;-> (5 2 3 5 1 9)
;(split-number (join-numbers '() 10) 10) ; -> ()
         		 	
         		 	
(define chars->bytes         		 	
  ; Takes a list of 16-bit Unicode characters (or 8-bit ASCII
  ; characters) and returns a list of bytes (numbers in the range
  ; [0,255]).  Characters whose code value is greater than 255 are
  ; encoded as a three-byte sequence, 255 <low byte> <high byte>.
  (lambda (chars)         		 	
    (if (null? chars)         		 	
	'()         		 	
	(let ((c (char->integer (car chars))))
	  (if (< c 255)         		 	
	      (cons c (chars->bytes (cdr chars)))
	      (let ((lowbyte (remainder c 256))
		    (highbyte  (quotient c 256)))
		(cons 255 (cons lowbyte (cons highbyte (chars->bytes (cdr chars)))))))))))
         		 	
; test cases         		 	
;(chars->bytes (string->list "hello")) ; -> (104 101 108 108 111)
;(chars->bytes (string->list "\u0000\u0000\u0000")) ; -> (0 0 0)
;(chars->bytes (string->list "\u3293\u5953\uabab")) ; -> (255 147 50 255 83 89 255 171 171)
         		 	
         		 	
(define bytes->chars         		 	
  ; Inverse of chars->bytes.  Takes a list of integers that encodes a
  ; sequence of characters, and returns the corresponding list of
  ; characters.  Integers less than 255 are converted directly to the
  ; corresponding ASCII character, and sequences of 255 <low-byte>
  ; <high-byte> are converted to a 16-bit Unicode character.
  (lambda (bytes)         		 	
    (if (null? bytes)         		 	
	'()         		 	
	(let ((b (car bytes)))         		 	
	  (if (< b 255)         		 	
	      (cons (integer->char b)
		    (bytes->chars (cdr bytes)))
	      (let ((lowbyte (cadr bytes))
		    (highbyte (caddr bytes)))
		(cons (integer->char (+ lowbyte (* highbyte 256)))
		      (bytes->chars (cdddr bytes)))))))))
         		 	
; test cases         		 	
;(bytes->chars '(104 101 108 108 111)) ; -> (#\h #\e #\l #\l #\o)
;(bytes->chars '(255 147 50 255 83 89 255 171 171)) ; -> (#\u3293 #\u5953 #\uabab)
         		 	
         		 	
         		 	
(define (string->integer string)
  ; returns an integer representation of an arbitrary string.
  (join-numbers (chars->bytes (string->list string)) 256))
         		 	
; test cases         		 	
;(string->integer "hello, world")
;(string->integer "")         		 	
;(string->integer "April is the cruelest month")
;(string->integer "\u0000\u0000\u0000")
         		 	
         		 	
(define (integer->string integer)
  ; inverse of string->integer.  Returns the string corresponding to
  ; an integer produced by string->integer.
  (list->string (bytes->chars (split-number integer 256))))
         		 	
; test cases         		 	
;(integer->string (string->integer "hello, world"))
;(integer->string (string->integer ""))
;(integer->string (string->integer "April is the cruelest month"))
;(integer->string (string->integer "\u0000\u0000\u0000"))
;(integer->string (string->integer "\u3293\u5953\uabab"))
