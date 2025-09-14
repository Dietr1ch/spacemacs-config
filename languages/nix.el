;; Nix

;; (add-hook 'nix-mode-hook
;;           (lambda ()
;;             ;; (envrc-reload)
;;             ;; (eglot)
;;             ;; (company-mode-on)
;;             ))

(spacemacs|define-custom-layout "@System"
  :binding "s"
  :body
  (winum-select-window-1)
  (find-file "~/.config/home-manager/home.nix")

  (split-window-right) ;; Create the right side (but don't move focus)
  (winum-select-window-2) ;; Go to the right window
  (find-file "~/.config/home-manager/home/")
  )


(with-eval-after-load 'recentf
  (add-to-list 'recentf-exclude "^/nix/store/*")
  )
