;; dotspacemacs/user-config ()

(setq max-lisp-eval-depth 10000)

(setq
 user-mail-address "Dietrich@Daroch.me"
 )

;; Browser
;; -------
(setopt
 browse-url-browser-function 'browse-url-firefox
 browse-url-firefox-program "librewolf"
 ;; https://sachachua.com/blog/2025/07/emacs-open-urls-or-search-the-web-plus-browse-url-handlers/
 ;; browse-url-handlers '(
 ;;												 ("https?://?medium\\.com" . browse-url-firefox)
 ;;                       ("https?://[^/]+/@[^/]+/.*" . mastodon-url-lookup)
 ;;                       ("https?://mailchimp\\.com" . browse-url-chrome)
 ;;                       ("https?://bbb\\.emacsverse\\.org" . browse-url-firefox)
 ;;                       ("https?://emacswiki.org" . eww)
 ;;												 )

 )

(add-to-list 'auto-mode-alist '("\\.\\(pl\\|pro\\|lgt\\)" . prolog-mode))


;; https://systemcrafters.net/emacs-from-scratch/the-best-default-settings/
;; Move customizations to a dedicated file
;; ~/.cache/spacemacs-dev/customise.el
(setq custom-file (concat spacemacs-cache-directory "customise.el"))
(load custom-file 'noerror 'nomessage)
(setq use-dialog-box nil)
;; Revert buffers when the underlying file has changed
(global-auto-revert-mode 1)
;; Revert Dired and other buffers
(setq global-auto-revert-non-file-buffers t)

(setq spacemacs-keep-legacy-current-buffer-delete-bindings nil)

(envrc-global-mode)

(setq-default
 indent-tabs-mode t
 tab-width 2
 )
(add-hook 'prog-mode-hook #'(lambda ()
															(dtrt-indent-mode)
															(dtrt-indent-adapt)))

;; TODO: Check out save-place-mode
(setq helm-ag-use-grep-ignore-list nil)

;; Clipboard
;; Disable clipboard integration. I don't want emacs to write into the system clipboard.
(setq x-select-enable-clipboard nil)
(defun clipboard/paste-from ()
	(interactive)
	(setq x-select-enable-clipboard t)
	(yank)
	(setq x-select-enable-clipboard nil))
;; (defun clipboard/copy-to()
;;   (interactive)
;;   (setq x-select-enable-clipboard t)
;;   (kill-ring-save (region-beginning) (region-end))
;;   (setq x-select-enable-clipboard nil))
(global-set-key (kbd "C-y") 'clipboard/paste-from)

(setq
 ;; split-window-sensibly [[help:split-window-sensibly]]
 split-width-threshold  120  ;; Allow splitting vertically if there'll remain at least 60 columns wide
 ;; split-height-threshold  80  ;; Allow splitting horizontally if there'll remain at least 40 lines tall
 split-height-threshold nil  ;; Don't allow horizontal splitting
 )

;; Fix
;;(setq projectile-project-search-path (cddr (directory-files "~/Projects" t)))
;;(projectile-discover-projects-in-search-path)
(setq
 projectile-globally-ignored-directories '(
																					 ;; Defaults
																					 "^\\.idea$"
																					 "^\\.vscode$"
																					 "^\\.ensime_cache$"
																					 "^\\.eunit$"
																					 "^\\.git$"
																					 "^\\.hg$"
																					 "^\\.fslckout$"
																					 "^_FOSSIL_$"
																					 "^\\.bzr$"
																					 "^_darcs$"
																					 "^\\.pijul$"
																					 "^\\.tox$"
																					 "^\\.svn$"
																					 "^\\.stack-work$"
																					 "^\\.ccls-cache$"
																					 "^\\.cache$"
																					 "^\\.clangd$"
																					 "^\\.sl$"
																					 "^\\.jj$"

																					 ;; Custom
																					 "^\\.direnv$"
																					 "^\\.devenv$"

																					 ;; Rust
																					 "^target$"
																					 "^\\.cargo$"
																					 ;; Helix
																					 "^\\.helix$"
																					 )
 projectile-global-ignore-file-patterns '(
																					"*\\.tmp$"
																					"*\\.sqlite$"
																					)
 projectile-globally-ignored-files '(
																		 "TAGS"
																		 ".pre-commit-config.yaml"
																		 )
 projectile-globally-ignored-file-suffixes '(
																						 ".lock"
																						 )
 projectile-project-search-path '(
																	"~/Projects/"
																	("~/Code/". 3)
																	("~/Documents/Org/" . 0)

																	("~/.config/home-manager/" . 0)
																	("~/.config/emacs/spacemacs-dev/distro/private/envrc/" . 0)
																	("~/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/cs2/cfg/" . 0)
																	;; ("/sudo::/etc/nixos/" . 0)
																	)
 magit-repository-directories '(
																("~/Projects/". 1)
																("~/Code/". 3)

																("~/.config/home-manager/" . 0)
																("~/.config/emacs/spacemacs-dev/distro/private/envrc/" . 0)
																("~/.local/share/Steam/steamapps/common/Counter-Strike Global Offensive/cs2/cfg/" . 0)
																)
 )

(helm-descbinds-mode 0)

;; text-mode
(add-hook 'text-mode-hook
					(lambda ()
						(auto-fill-mode 80)
						(turn-on-auto-fill)
						))

;; PDF viewer
(setq doc-view-continuous t)

;; Prettify symbols
(global-prettify-symbols-mode 1)

;; Web mode
(defun my/web-mode-hook ()
	"Hooks for Web mode."
	(setq web-mode-markup-indent-offset 2)
	(setq web-mode-css-indent-offset 2)
	(setq web-mode-code-indent-offset 2)
	)
(add-hook 'web-mode-hook 'my/web-mode-hook)


;; Layouts
(spacemacs|define-custom-layout "@Emacs"
	:binding "e"
	:body
	(winum-select-window-1)
	(find-file "~/.config/emacs/spacemacs-dev/config/init.el")
	)


;; Recentf
(with-eval-after-load 'recentf
	;; Recentf exclusions
	(add-to-list 'recentf-exclude "/\\.cache/")
	(add-to-list 'recentf-exclude "/target/")
	(add-to-list 'recentf-exclude "\\.orig$")
	(add-to-list 'recentf-exclude "\\.sqlite$")

	(add-to-list 'recentf-exclude "^/nix/")
	(add-to-list 'recentf-exclude "^/tmp/")

	;; Kill-hook
	(add-hook 'kill-emacs-hook 'recentf-save-list)

	;; Timer
	(when (daemonp)
		(run-at-time nil (* 3 60)
								 'recentf-save-list))
	)

(spacemacs/set-leader-keys
	"B" 'helm-bookmarks
	)

(spacemacs/set-leader-keys
	"<DEL> W" 'whitespace-cleanup
	"<DEL> d" 'envrc-reload
	"<DEL> D" 'envrc-reload-all
	)

(spacemacs/set-leader-keys
	;; Missing shortcuts
	"i c" 'insert-char
	"i C" 'clipboard/paste-from
	"x T" 'titlecase-region

	;; Bug fixes
	"<SPC>" 'spacemacs/helm-M-x-fuzzy-matching
	"q q" 'delete-frame

	;; Quick shortcuts
	"<DEL> <SPC>" 'helm-semantic
	)

;; Shortcuts
(spacemacs/declare-prefix "<DEL>" "Custom prefix")
(evil-leader/set-key "of" #'projectile-find-other-file)

;; (setq ezml-tsauto-config
;;       (make-treesit-auto-recipe
;;        :lang 'ezml
;;        :ts-mode 'ezml-ts-mode
;;        :url "https://github.com/Dietr1ch/tree-sitter-ezml"
;;        :revision "master"
;;        :source-dir "src"
;;        :ext "\\.zml\\'"))
;; (add-to-list 'treesit-auto-recipe-list ezml-tsauto-config)


;; Git
;; ---
(require 'git-commit)
(global-git-commit-mode t)


;; GPTel
;; -----
;; (setq gptel-prompt-prefix-alist "@user\n")
;; (setq gptel-response-prefix-alist "@assistant\n")
;; (setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
;; (setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n")


(gptel-make-anthropic "Claude"
	:stream t
	)
(gptel-make-openai "Github"
	:stream t
	:models '(
						gpt-4o
						)
	)
(setq
 gptel-backend (gptel-make-ollama "Ollama"
								 :host "localhost:11434"
								 :stream t
								 :models '(
													 ;; Models from `ollama list'
													 deepseek-r1:latest
													 gemma3:latest
													 phi4:latest
													 qwq:latest
													 )
								 )
 )



;; ispell
;; ------

;; (with-eval-after-load 'ispell
;;   ;; NOTE spell-checking layer config in ./layers.el
;;   ;;   ;; ispell-set-spellchecker-params has to be called
;;   ;;   ;; before ispell-hunspell-add-multi-dic will work
;;   ;;
;;   ;;   (ispell-set-spellchecker-params)
;;   ;;   (ispell-hunspell-add-multi-dic "en_US,es_CL,de_DE")
;;
;;   ;; (setenv "LANG" "en_US.UTF-8")
;;   (ispell-set-spellchecker-params)
;;   (ispell-hunspell-add-multi-dic "en_GB,es_CL,de_DE")
;;   )

;; https://www.spacemacs.org/layers/+checkers/spell-checking/README.html#enabling-multi-dictionary-support-with-hunspell
(with-eval-after-load "ispell"
	(setq ispell-program-name "hunspell")

	;; ispell-set-spellchecker-params has to be called
	;; before ispell-hunspell-add-multi-dic will work
	(ispell-set-spellchecker-params)
	;; (ispell-hunspell-add-multi-dic "en_GB,es_CL,de_DE")
	(setq ispell-dictionary "en_GB")
	)


(with-eval-after-load 'magit-mode
	(require 'gptel-magit)
	(gptel-magit-install)
	)

(setq terminal-here-linux-terminal-command 'alacritty)

(setq
 oj-home-dir "~/Workspace/CP/oj"
 oj-default-online-judge 'codeforces
 oj-online-judges '(
										(codeforces         . ((name . "Codeforces")               (url . "https://codeforces.com/contests/")))
										(hackerrank         . ((name . "HackerRank")               (url . "https://www.hackerrank.com/challenges/")))
										(hackerrank-contest . ((name . "HackerRank Contest")       (url . "https://www.hackerrank.com/contests/")))
										(kattis             . ((name . "Kattis")                   (url . "https://open.kattis.com/problems/")))
										(topcoder           . ((name . "Topcoder")                 (url . "https://www.topcoder.com/challenges/")))
										)
 )
(setq
 leetcode-prefer-language "rust"
 ;; leetcode-prefer-sql "psql" ;; There's no psql mentioned in leetcode--lang-suffixes

 leetcode-directory "~/Workspace/CP/leetcode"
 leetcode-save-solutions t
 )


(message "Loading language configuration...")
(load-file (concat dotspacemacs-directory "languages/rust.el"))     ;; ../languages/rust.el
(load-file (concat dotspacemacs-directory "languages/cpp.el"))      ;; ../languages/cpp.el
(load-file (concat dotspacemacs-directory "languages/python.el"))   ;; ../languages/python.el
(load-file (concat dotspacemacs-directory "languages/haskell.el"))  ;; ../languages/haskell.el

(load-file (concat dotspacemacs-directory "languages/nix.el"))      ;; ../languages/nix.el
(with-eval-after-load 'org
	;; https://www.spacemacs.org/layers/+emacs/org/README.html#important-note
	(load-file (concat dotspacemacs-directory "languages/org.el"))      ;; ../languages/org.el
	)
(message "Loading language configuration... DONE")

;; (spacemacs/toggle-debug-on-error-off)
