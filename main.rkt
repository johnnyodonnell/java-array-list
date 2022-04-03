#lang racket

;; Notice
;; To install (from within the package directory):
;;   $ raco pkg install
;; To install (once uploaded to pkgs.racket-lang.org):
;;   $ raco pkg install <<name>>
;; To uninstall:
;;   $ raco pkg remove <<name>>
;; To view documentation:
;;   $ raco docs <<name>>
;;
;; For your convenience, we have included LICENSE-MIT and LICENSE-APACHE files.
;; If you would prefer to use a different license, replace those files with the
;; desired license.
;;
;; Some users like to add a `private/` directory, place auxiliary files there,
;; and require them in `main.rkt`.
;;
;; See the current version of the racket style guide here:
;; http://docs.racket-lang.org/style/index.html

;; Code here

(provide array-list%)


;; array-list class that is based on Java's ArrayList
;; Not a complete implementation yet

(define array-list%
  (class* object%
          ()
          (super-new)
          (init-field [initial-capacity 10])
          (field (vec (make-vector initial-capacity)))
          (field (_size 0))
          (define/public add
                         (lambda (element)
                           (begin
                             (if (>= _size (vector-length vec))
                               (set-field! vec this
                                           (build-vector
                                             (* 2 (vector-length vec))
                                             (lambda (i)
                                               (cond
                                                 [(< i (vector-length vec))
                                                  (vector-ref vec i)]
                                                 [else 0]))))
                               (void))
                             (vector-set! vec _size element)
                             (set-field! _size this (add1 _size)))))
          (define/public get
                         (lambda (index)
                           (vector-ref vec index)))
          (define/public size (lambda () _size))))

