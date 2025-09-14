;; Haskell

(add-hook 'haskell-mode-hook
          (lambda ()
            (setq prettify-symbols-alist '(
                                           ;; Logic
                                           ("True"  . ?⟙)  ;; LARGE DOWN TACK
                                           ("False" . ?⟘)  ;; LARGE UP TACK
                                           )
                  ))
          )  ;; add-hook 'haskell-mode-hook
