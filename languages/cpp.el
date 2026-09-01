;; C++  -*- lexical-binding: t; -*-

(add-hook 'c++-mode-hook
          (lambda ()
            (setq prettify-symbols-alist '(
                                           ;; Syntax
                                           ("for"      . ?∀)  ;; FOR ALL
                                           ("loop"     . ?⟳)  ;; CLOCKWISE GAPPED CIRCLE ARROW
                                           ("in"       . ?∈)  ;; ELEMENT OF
                                           ("not in"       . ?∉)  ;; NOT AN ELEMENT OF
                                           ("continue" . ?↰)  ;; UPWARDS ARROW WITH TIP LEFTWARDS
                                           ;; ("return"   . ?⇙)  ;; SOUTH WEST DOUBLE ARROW
                                           ;; ("return"   . ?⏎)  ;; RETURN SYMBOL
                                           ("return"   . ?⟸)  ;; LONG LEFTWARDS DOUBLE ARROW
                                           ("  assert"   . ?⊦)  ;; ASSERTION
                                           ("assert"   . ?⊦)  ;; ASSERTION

                                           ;; Logic
                                           ("&&" .   #x2227)  ;; LOGICAL AND: ∧
                                           ("||" .   #x2228)  ;; LOGICAL OR:  ∨
                                           ("true" .     #x27d9)  ;; LARGE DOWN TACK: ⟙
                                           ("false" .    #x27d8)  ;; LARGE UP TACK: ⟘

                                           ;; Fields (MATHEMATICAL DOUBLE-STRUCK CAPITAL)
                                           ("bool"        . ?𝔹)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL B
                                           ("std::string" . ?𝕊)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL S
                                           ("std::vector" . ?𝕍)  ;; MATHEMATICAL DOUBLE-STRUCK CAPITAL V
                                           ("std::unordered_set" . ?𝔖)  ;; MATHEMATICAL FRAKTUR CAPITAL S
                                           ("std::unordered_map" . ?𝔇)  ;; MATHEMATICAL FRAKTUR CAPITAL D
                                           ("std::map"           . ?𝔗)  ;; MATHEMATICAL FRAKTUR CAPITAL T
                                           ("int8"    . (#x2124 #x38))            ;; DOUBLE-STRUCK CAPITAL Z: ℤ8
                                           ("int16"   . (#x2124 #x31 #x36))       ;; DOUBLE-STRUCK CAPITAL Z: ℤ16
                                           ("int32"   . (#x2124 #x33 #x32))       ;; DOUBLE-STRUCK CAPITAL Z: ℤ32
                                           ("int64"   . (#x2124 #x36 #x34))       ;; DOUBLE-STRUCK CAPITAL Z: ℤ64
                                           ("int128"  . (#x2124 #x31 #x32 #x38))  ;; DOUBLE-STRUCK CAPITAL Z: ℤ128
                                           ("uint8"    . (#x2115 #x38))            ;; DOUBLE-STRUCK CAPITAL N: ℕ8
                                           ("uint16"   . (#x2115 #x31 #x36))       ;; DOUBLE-STRUCK CAPITAL N: ℕ16
                                           ("uint32"   . (#x2115 #x33 #x32))       ;; DOUBLE-STRUCK CAPITAL N: ℕ32
                                           ("uint64"   . (#x2115 #x36 #x34))       ;; DOUBLE-STRUCK CAPITAL N: ℕ64
                                           ("uint128"  . (#x2115 #x31 #x32 #x38))  ;; DOUBLE-STRUCK CAPITAL N: ℕ128
                                           ("size_t" . (#x2115 #x73))            ;; DOUBLE-STRUCK CAPITAL N: ℕs
                                           ("float"  . (#x211d #x33 #x32))       ;; DOUBLE-STRUCK CAPITAL R: ℝ32
                                           ("double"  . ?ℝ)  ;; DOUBLE-STRUCK CAPITAL R

                                           ;; Math
                                           (".add"   . ?∔)  ;; DOT PLUS
                                           (".sub"   . ?∸)  ;; DOT MINUS
                                           (".div"   . ?÷)  ;; DIVISION SIGN
                                           (".mul"   . ?⨰)  ;; MULTIPLICATION SIGN WITH DOT ABOVE

                                           (".push"   . ?⧺)  ;; DOUBLE PLUS
                                           (".extend"   . ?⧻)  ;; TRIPLE PLUS
                                           (".insert" . ?⟜) ;; LEFT MULTIMAP
                                           )
                  ))
          )  ;; add-hook 'c++-mode-hook
