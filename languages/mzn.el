;; MiniZinc

(add-hook 'minizinc-ts-mode-hook
          (lambda ()
            (setq prettify-symbols-alist '(
                                           ("constraint"  . ?❕) ;; WHITE EXCLAMATION MARK ORNAMENT
                                           ;; ("solve"   . ?🏁)  ;; CHEQUERED FLAG

                                           ("array" . ?𝔇)  ;; MATHEMATICAL FRAKTUR CAPITAL D
                                           ("of"    . ?⇒)  ;; RIGHTWARDS DOUBLE ARROW
                                           ("enum"  . ?🗅)  ;; EMPTY NOTE

                                           ("forall" . ?∀)  ;; FOR ALL
                                           ("in"       . ?∈)  ;; ELEMENT OF
                                           ("if"       . ?？) ;; FULLWIDTH QUESTION MARK
                                           ("then"       . ?⇨) ;; RIGHTWARDS WHITE ARROW
                                           ("else"     . ?¿)  ;; INVERTED QUESTION MARK
                                           ("endif"       . ?□) ;; WHITE SQUARE

                                           ("sum"  . ?Σ)  ;; GREEK CAPITAL LETTER SIGMA
                                           ;; ("max"  . ?Σ)  ;; GREEK CAPITAL LETTER SIGMA
                                           ;; ("min"  . ?Σ)  ;; GREEK CAPITAL LETTER SIGMA
                                           ;; ("ceil" . ?⌈)  ;; LEFT CEILING
                                           ;; ("log" . ?⌈)  ;; LEFT CEILING
                                           ;; ("sqrt" . ?√)  ;; SQUARE ROOT

                                           ("bool"   . ?𝔹)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL B
                                           ("float"  . ?ℝ)  ;; DOUBLE-STRUCK CAPITAL R
                                           ("int"    . ?ℕ)  ;; DOUBLE-STRUCK CAPITAL N

                                           ;; Syntax
                                           ("\/\\"    . ?∧)  ;; LOGICAL AND
                                           ("\\\/"    . ?∨)  ;; LOGICAL OR
                                           )
                  ) ;; setq prettify-symbols-alist
            )
          )  ;; add-hook 'rust-mode-hook
