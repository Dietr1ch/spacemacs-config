;; Haskell

(add-hook 'haskell-mode-hook
          (lambda ()
            (setq prettify-symbols-alist '(
                                           ;; Numbers
                                           ("Integer" . ?ℤ)  ;; DOUBLE-STRUCK CAPITAL Z
                                           ("Natural" . ?ℕ)  ;; DOUBLE-STRUCK CAPITAL N

                                           ;; Logic
                                           (" . "  . ?⋅)  ;; DOT OPERATOR
                                           ("True"  . ?⟙)  ;; LARGE DOWN TACK
                                           ("False" . ?⟘)  ;; LARGE UP TACK
                                           )
                  ))
          )  ;; add-hook 'haskell-mode-hook
