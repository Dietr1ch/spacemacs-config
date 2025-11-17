;; dotspacemacs/user-init ()


;; emacs-lsp-booster (https://github.com/blahgeek/emacs-lsp-booster)
;; -----------------
(defun lsp-booster--advice-json-parse (old-fn &rest args)
	"Try to parse bytecode instead of JSON."
	(or
	 (when (equal (following-char) ?#)
		 (let ((bytecode (read (current-buffer))))
			 (when (byte-code-function-p bytecode)
				 (funcall bytecode))))
	 (apply old-fn args)))
(advice-add (if (progn (require 'json)
											 (fboundp 'json-parse-buffer))
								'json-parse-buffer
							'json-read)
						:around
						#'lsp-booster--advice-json-parse)

(defun lsp-booster--advice-final-command (old-fn cmd &optional test?)
	"Prepend emacs-lsp-booster command to lsp command."
	(let ((orig-result (funcall old-fn cmd test?)))
		(if (and (not test?)                             ;; for check lsp-server-present?
						 (not (file-remote-p default-directory)) ;; see lsp-resolve-final-command, it would add extra shell wrapper
						 lsp-use-plists
						 (not (functionp 'json-rpc-connection))  ;; native JSON-RPC
						 (executable-find "emacs-lsp-booster"))
				(progn
					(when-let ((command-from-exec-path (executable-find (car orig-result))))  ;; resolve command from exec-path (in case not found in $PATH)
						(setcar orig-result command-from-exec-path))
					(message "Using emacs-lsp-booster for %s!" orig-result)
					(cons "emacs-lsp-booster"
								(cons "--verbose"
											(cons "--"
														orig-result))))
			orig-result)))
(advice-add 'lsp-resolve-final-command :around #'lsp-booster--advice-final-command)


;; mpdel
;; -----
(setq
 libmpdel-hostname (or (getenv "MPD_HOST") "localhost")
 libmpdel-port (or (getenv "MPD_PORT") 6600)
 )


;; TRAMP
;; -----
;; Making TRAMP go brrrr: https://coredumped.dev/2025/06/18/making-tramp-go-brrrr./ (https://news.ycombinator.com/item?id=44356346)
(setq
 remote-file-name-inhibit-locks t
 tramp-use-scp-direct-remote-copying t
 remote-file-name-inhibit-auto-save-visited t

 tramp-copy-size-limit (* 1024 1024) ;; 1 MB
 ;; tramp-verbose 2
 )

(connection-local-set-profile-variables
 'remote-direct-async-process
 '((tramp-direct-async-process . t)))

(connection-local-set-profiles
 '(:application tramp :machine "sigterm")
 'remote-direct-async-process)
(connection-local-set-profiles
 '(:application tramp :machine "raft")
 'remote-direct-async-process)

(setq magit-tramp-pipe-stty-settings 'pty)



;; LocalWords: LocalWords brrrr  dotspacemacs mpdel
