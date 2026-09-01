;; Python  -*- lexical-binding: t; -*-

;; Prettify symbols - Python
(add-hook 'python-mode-hook
          (lambda ()
            (setq prettify-symbols-alist '(
                                           ;; Syntax
                                           ("def"      . ?ℱ)  ;; SCRIPT F
                                           ("not"      . ?¬)  ;; NOT SIGN
                                           ("for"      . ?∀)  ;; FOR ALL
                                           ("in"       . ?∈)  ;; ELEMENT OF
                                           ("not in"   . ?∉)  ;; NOT AN ELEMENT OF

                                           ("continue" . ?↰)  ;; UPWARDS ARROW WITH TIP LEFTWARDS
                                           ;; ("return"   . ?⇙)  ;; SOUTH WEST DOUBLE ARROW
                                           ;; ("return"   . ?⏎)  ;; RETURN SYMBOL
                                           ("return"   . ?⟸)  ;; LONG LEFTWARDS DOUBLE ARROW
                                           ("yield"    . ?⤙)  ;; LEFTWARDS ARROW-TAIL
                                           ("lambda" . ?λ)

                                           ;; Pytype - Base Types
                                           ("Int"    . ?ℤ)  ;; DOUBLE-STRUCK CAPITAL Z
                                           ("Float"  . ?ℝ)  ;; DOUBLE-STRUCK CAPITAL R
                                           ("String" . ?𝕊)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL S

                                           ;; Logic
                                           ("and"   . ?∧)  ;; LOGICAL AND
                                           ("or"    . ?∨)  ;; LOGICAL OR
                                           ("True"  . ?⟙)  ;; LARGE DOWN TACK
                                           ("False" . ?⟘)  ;; LARGE UP TACK

                                           ;; Pytype - Collections
                                           ("List" .     #x2112)
                                           ("Tuple" .    #x2a02)
                                           ("Dict" .     ?𝔇)  ;; MATHEMATICAL FRAKTUR CAPITAL D:
                                           ("Set" .      ?𝔖)  ;; MATHEMATICAL FRAKTUR CAPITAL S:
                                           ("Iterable" . #x1d50a)
                                           ("Any" .      #x2754)
                                           ("Union" .    #x22c3)
                                           )
                  ))
          )  ;; add-hook 'python-mode-hook
