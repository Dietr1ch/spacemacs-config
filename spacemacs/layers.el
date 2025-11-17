(setq-default

 dotspacemacs-configuration-layers
 '(
	 (spacemacs-layouts :variables
											spacemacs-layouts-restrict-spc-tab t)

	 (helm  ;; https://www.spacemacs.org/layers/+completion/helm/README.html
		:variables
		helm-ag-use-grep-ignore-list nil
		helm-position 'bottom
		helm-rg-input-min-search-chars 2
		helm-default-external-file-browser "dolphin"

		spacemacs-helm-rg-max-column-number 1024
		)
	 (treemacs ;; https://www.spacemacs.org/layers/+filetree/treemacs/README.html
		:variables
		;; treemacs-use-follow-mode t
		treemacs-use-follow-mode 'tag
		treemacs-use-filewatch-mode t
		treemacs-use-all-the-icons-theme t
		treemacs-use-git-mode 'deferred  ;; https://github.com/Alexander-Miller/treemacs#git-mode
		treemacs-use-scope-type 'Frames
		;; TODO try out perspectives
		;; treemacs-use-scope-type 'Perspectives

		treemacs-litter-directories '(
																	;; Nix
																	"/.devenv"
																	"/.direnv"
																	"/result"
																	;; Rust
																	"/target"

																	;; Python
																	"/.venv"
																	".mypy_cache"
																	"__pycache__"
																	;; Node
																	"/node_modules"
																	)
		)
	 (auto-completion ;; https://www.spacemacs.org/layers/+completion/auto-completion/README.html
		:variables
		auto-completion-return-key-behavior 'complete
		auto-completion-tab-key-behavior 'cycle

		auto-completion-complete-with-key-sequence nil
		;; auto-completion-complete-with-key-sequence (kbd "jk")
		;; auto-completion-complete-with-key-sequence-delay 0.3

		auto-completion-enable-sort-by-usage t
		auto-completion-enable-help-tooltip t
		;; auto-completion-enable-help-tooltip 'manual
		auto-completion-enable-snippets-in-popup t

		global-completion-preview-mode t

		;; Snippets
		;; https://www.spacemacs.org/layers/+completion/auto-completion/README.html#snippets-directories
		auto-completion-private-snippets-directory "~/Projects/emacs-snippets"

		company-emoji-insert-unicode t
		company-minimum-prefix-length 1
		)
	 (templates ;; https://www.spacemacs.org/layers/+completion/templates/README.html
		:variables
		templates-private-directory "~/Projects/emacs-templates"
		;; TODO try out default templates for a while
		;; templates-use-default-templates nil
		)
	 (typography ;; https://www.spacemacs.org/layers/+emacs/typography/README.html
		:variables
		typography-enable-typographic-editing nil
		)
	 (spell-checking  ;; https://www.spacemacs.org/layers/+checkers/spell-checking/README.html
		:variables
		spell-checking-enable-by-default t
		spell-checking-enable-auto-dictionary t
		enable-flyspell-auto-completion t

		;; Hunspel
		ispell-program-name "hunspell"
		ispell-dictionary "en_GB"
		ispell-local-dictionary "en_GB"
		)
	 dtrt-indent ;; https://www.spacemacs.org/layers/+misc/dtrt-indent/README.html
	 ;; TODO: Add harper
	 (syntax-checking
		:variables
		syntax-checking-enable-by-default t
		syntax-checking-enable-tooltips t
		)
	 (tree-sitter ;; https://www.spacemacs.org/layers/+tools/tree-sitter/README.html
		:variables

		;; spacemacs-tree-sitter-hl-black-list '(
		;;																			js2-mode
		;;																			rjsx-mode
		;;																			)
		tree-sitter-fold-enable t
		tree-sitter-fold-indicators-enable nil
		tree-sitter-indent t
		tree-sitter-indent-current-scopes t
		tree-sitter-indent-enable t
		tree-sitter-indent-rust-scopes t
		tree-sitter-indent-rustic-scopes t
		tree-sitter-syntax-highlight-enable t
		)

	 (llm-client  ;; https://www.spacemacs.org/layers/+web-services/llm-client/README.html
		:variables
		llm-client-enable-gptel t
		;; llm-client-enable-ellama t

		gptel-default-mode 'org-mode
		;; gptel-temperature 1.0
		gptel-model 'deepseek-r1:latest
		)
	 (dash ;; https://www.spacemacs.org/layers/+tools/dash/README.html
		:variables
		dash-docs-docset-newpath "~/.docsets"
		)

	 (elfeed :variables
					 elfeed-search-filter "@1-week-ago +unread"
					 rmh-elfeed-org-files (list "~/Documents/Org/Feeds.org"))

	 ;; Source control  https://www.spacemacs.org/layers/LAYERS.html#source-control
	 (git  ;; https://www.spacemacs.org/layers/+source-control/git/README.html
		:variables
		git-enable-magit-delta-plugin t
		git-enable-magit-gitflow-plugin t
		git-enable-magit-todos-plugin t

		magit-revision-show-gravatars nil
		)

	 (envrc ;; ~/.config/emacs/spacemacs-dev/distro/private/envrc/README.org
		)
	 (systemd ;; https://www.spacemacs.org/layers/+tools/systemd/README.html
		)
	 (nixos ;; https://www.spacemacs.org/layers/+os/nixos/README.html
		:variables
		nix-backend 'lsp
		nixos-format-on-save t)

	 (lsp ;; https://www.spacemacs.org/layers/+tools/lsp/README.html
		:variables

		lsp-use-plists t
		lsp-eldoc-enable-hover t
		lsp-eldoc-render-all t
		lsp-enable-folding t
		lsp-enable-indentation t
		lsp-enable-on-type-formatting t
		lsp-enable-snippet t
		lsp-enable-suggest-server-download nil
		lsp-enable-symbol-highlighting t
		lsp-enable-xref t
		lsp-format-buffer-on-save t
		;; https://emacs-lsp.github.io/lsp-mode/page/settings/headerline/
		lsp-headerline-breadcrumb-enable t
		lsp-headerline-breadcrumb-segments '(project file symbols)
		lsp-inlay-hint-enable t
		lsp-insert-final-newline t
		;; https://emacs-lsp.github.io/lsp-mode/page/settings/lens/
		lsp-lens-enable t
		lsp-log-io nil
		lsp-log-max-message-log-max 1000
		;; https://emacs-lsp.github.io/lsp-mode/page/settings/modeline/
		lsp-modeline-code-actions-enable t
		lsp-modeline-diagnostics-enable t
		lsp-semantic-tokens-enable t
		lsp-trim-final-newlines t
		lsp-trim-trailing-whitespace t
		;; lsp-ui
		;; lsp-ui-doc (https://github.com/emacs-lsp/lsp-ui#lsp-ui-doc)
		lsp-ui-doc-enable t
		lsp-ui-doc-include-signature t
		;; lsp-ui-sideline (https://github.com/emacs-lsp/lsp-ui#lsp-ui-sideline)
		lsp-ui-sideline-show-symbol t
		;; lsp-ui-peek (https://github.com/emacs-lsp/lsp-ui#lsp-ui-peek)

		lsp-file-watch-ignored-files '(
																	 "[/\\\\]flycheck_[^/\\\\]+\\'"
																	 "[/\\\\]\\.#[^/\\\\]+\\'"
																	 "[/\\\\][^/\\\\]+~\\'"
																	 )
		lsp-file-watch-ignored-directories '(
																				 "[/\\\\]\\.git\\'"
																				 "[/\\\\]\\.github\\'"
																				 "[/\\\\]\\.gitlab\\'"
																				 "[/\\\\]\\.hg\\'"

																				 "[/\\\\]\\.cache\\'"

																				 "[/\\\\]\\.direnv\\'"
																				 "[/\\\\]\\.devenv\\'"
																				 "[/\\\\]\\.devenv\\.*\\'"
																				 "[/\\\\]\\result"

																				 ;; Rust
																				 "[/\\\\]target\\'"
																				 ;; Python
																				 "[/\\\\]\\.mypy_cache\\'"
																				 "[/\\\\]\\.pytest_cache\\'"
																				 "[/\\\\]__pycache__\\'"
																				 "[/\\\\]site-packages\\'"
																				 )

		;; Web
		;; lsp-html (https://emacs-lsp.github.io/lsp-mode/page/lsp-html/)
		;; --------
		lsp-html-format-enable t
		lsp-html-format-end-with-newline t
		lsp-html-format-indent-inner-html t

		;; Nix
		;; lsp-nix-nixd-server-path "nixd"
		lsp-nix-nixd-formatting-command [ "nixfmt" ]
		lsp-nix-nixd-nixpkgs-expr "import <nixpkgs> { }"
		;; lsp-nix-nixd-nixos-options-expr "(builtins.getFlake \"/home/dietr1ch/nixos\").nixosConfigurations.mnd.options"
		;; lsp-nix-nixd-home-manager-options-expr "(builtins.getFlake \"/home/dietr1ch/nixos\").homeConfigurations.\"dietr1ch@mnd\".options"

		;; Rust
		lsp-rust-all-targets t

		;; lsp-rust-analyzer (https://emacs-lsp.github.io/lsp-mode/page/lsp-rust-analyzer/)
		;; -----------------
		lsp-rust-analyzer-cargo-auto-reload t
		lsp-rust-analyzer-cargo-run-build-scripts t
		lsp-rust-analyzer-cargo-watch-command "clippy"  ;; Instead of "check"
		lsp-rust-analyzer-cargo-watch-enable t
		lsp-rust-analyzer-check-all-targets t
		lsp-rust-analyzer-closing-brace-hints-min-lines 30
		lsp-rust-analyzer-diagnostics-enable t
		lsp-rust-analyzer-discriminants-hints "fieldless"
		lsp-rust-analyzer-display-chaining-hints t
		lsp-rust-analyzer-display-closure-return-type-hints t
		lsp-rust-analyzer-display-lifetime-elision-hints-enable "skip_trivial"
		lsp-rust-analyzer-display-parameter-hints t
		lsp-rust-analyzer-display-reborrow-hints "mutable"
		lsp-rust-analyzer-expression-adjustment-hints "always"
		lsp-rust-analyzer-implicit-drops nil
		lsp-rust-analyzer-lens-references-adt-enable t
		lsp-rust-analyzer-rustfmt-rangeformatting-enable t
		lsp-rust-analyzer-lens-enable t
		lsp-rust-analyzer-proc-macro-enable t
		lsp-rust-clippy-preference "on"
		lsp-rust-full-docs t
		lsp-rust-show-hover-context t
		lsp-rust-show-warnings t
		)
	 (dap ;; https://www.spacemacs.org/layers/+tools/dap/README.html
		:variables
		dap-enable-mouse-support t)

	 ;; Languages
	 emacs-lisp
	 (haskell ;; https://www.spacemacs.org/layers/+lang/haskell/README.html
		:variables
		haskell-completion-backend 'eglot
		)
	 (c-c++ ;; https://www.spacemacs.org/layers/+lang/c-c++/README.html
		:variables
		c-c++-backend 'eglot
		c-c++-enable-clang-format-on-save t
		)
	 (rust  ;; https://www.spacemacs.org/layers/+lang/rust/README.html
		:variables
		;; rust-mode-treesitter-derive t. Can't find grammars?!

		rustic-lsp-client 'lsp-mode
		rustic-lsp-server 'rust-analyzer

		rustic-format-trigger 'on-save  ;; 'on-compile
		rustic-rustfmt-args "--edition=2024"

		rustic-cargo-clippy-trigger-fix 'on-compile
		rustic-default-clippy-arguments "--all-targets --all-features"
		)
	 (python ;; https://www.spacemacs.org/layers/+lang/python/README.html
		:variables
		python-backend 'lsp
		python-format-on-save t)
	 (javascript ;; https://www.spacemacs.org/layers/+lang/javascript/README.html
		:variables
		javascript-backend 'lsp
		javascript-fmt-on-save t
		js2-mode-show-strict-warnings t
		js2-mode-show-parse-errors t)
	 (typescript ;; https://www.spacemacs.org/layers/+lang/typescript/README.html
		:variables
		typescript-linter 'eslint
		typescript-backend 'lsp
		typescript-fmt-on-save t)
	 protobuf

	 graphviz

	 (sql  ;; https://www.spacemacs.org/layers/+lang/sql/README.html
		:variables
		sql-backend 'lsp
		sql-capitalize-keywords nil
		sql-lsp-sqls-workspace-config-path 'workspace
		)


	 multiple-cursors

	 (org ;; https://www.spacemacs.org/layers/+emacs/org/README.html
		:variables
		org-directory "~/Documents/Org/"
		org-default-notes-file (concat org-directory "Inbox.org")
		org-project-capture-projects-file "TODOs.org"
		org-capture-templates '(
														;; https://orgmode.org/manual/Capture-templates.html
														("t" "Task" entry
														 (file+headline "~/Documents/Org/Inbox.org" "Tasks")
														 "** %?")
														("T" "TODO" entry
														 (file+headline "~/Documents/Org/Inbox.org" "Tasks")
														 "** TODO %?")

														;; Org Capture
														;; https://orgmode.org/worg/org-contrib/org-protocol.html
														;; ~/.local/share/applications/emacsclient-capture.desktop
														("l" "Protocol Link" entry
														 (file+headline "~/Documents/Org/Inbox.org" "Web")
														 "** %?[[%:link][%:description]]\nCaptured On: %U")
														("L" "Protocol Link with Selection" entry
														 (file+headline "~/Documents/Org/Inbox.org" "Web")
														 "** [[%:link][%:description]]\nCaptured On: %U\n\n#+begin_quote\n%i\n#+end_quote\n\n\n%?")
														)

		;; Style
		org-enable-appear-support t
		org-enable-modern-support t
		org-image-actual-width 1.0
		org-enable-sticky-header t
		;; HTML export (https://orgmode.org/manual/Publishing-options.html)
		org-export-with-smart-quotes t
		org-html-prefer-user-labels t
		org-html-with-latex t
		org-export-coding-system 'utf-8
		org-enable-transclusion-support t

		;; Notifications
		org-enable-notifications nil  ;; BROKEN!
		org-start-notification-daemon-on-startup t

		;; org-contacts
		org-enable-org-contacts-support t
		org-contacts-directory "~/Documents/Org/People/"

		;; org-roam
		org-enable-roam-support t
		org-enable-roam-protocol t
		org-roam-v2-ack t
		org-roam-complete-everywhere t
		org-roam-directory "~/Documents/Org/"
		org-enable-roam-ui t

		org-roam-capture-templates '(
																 ("d" "default" plain "%?"
																	:if-new (file+head "Roam/%<%Y%m%d%H%M%S>-${slug}.org"
																										 "#+title: ${title}\n")
																	:dir-name "Roam"
																	:unnarrowed t)

																 ("B" "Book" plain "%?"
																	:if-new (file+head "Books/%<%Y%m%d%H%M%S>-${slug}.org"
																										 "#+title: ${title}\n#+filetags: :Reading:Book:\n#+TODO: READ(r) READING(rr) | DONE(d) SKIMMED(s) IGNORED(i)\n")
																	:dir-name "Books"
																	:unnarrowed t)
																 ("a" "Article" plain "%?"
																	:if-new (file+head "Articles/%<%Y%m%d%H%M%S>-${slug}.org"
																										 "#+title: ${title}\n#+filetags: :Reading:Article:\n#+TODO: READ(r) READING(rr) | DONE(d) SKIMMED(s) IGNORED(i)\n")
																	:dir-name "Articles"
																	:unnarrowed t)
																 ("b" "blog" plain "%?"
																	:if-new (file+head "Articles/%<%Y%m%d%H%M%S>-blog_${slug}.org"
																										 "#+title: Blog| ${title}\n#+filetags: :Reading:Blog:\n#+TODO: READ(r) READING(rr) | DONE(d) SKIMMED(s) IGNORED(i)")
																	:dir-name "Articles"
																	:unnarrowed t)
																 ("p" "paper" plain "%?"
																	:if-new (file+head "Articles/%<%Y%m%d%H%M%S>-paper_${slug}.org"
																										 "#+title: Paper| ${title}\n#+filetags: :Reading:Blog:\n#+TODO: READ(r) READING(rr) | DONE(d) SKIMMED(s) IGNORED(i)")
																	:dir-name "Articles"
																	:unnarrowed t)
																 ("c" "Cooking" plain "%?"
																	:if-new (file+head "Cooking/${slug}.org"
																										 "#+title: ${title}\n")
																	:dir-name "Cooking"
																	:unnarrowed t)

																 ;; MtG
																 ;; ---
																 ("M" "Templates for Magic Cards")
																 ("MC" "Magic| Card" plain "%?"
																	:if-new (file+head "Games/MtG/Cards/${title}.org"
																										 "#+title: ${title}\n#+filetags: :MtG:MtG-Card:\n")
																	:dir-name "Games/MtG/Cards"
																	:unnarrowed t)
																 ("ML" "Magic| Land" plain "%?"
																	:if-new (file+head "Games/MtG/Cards/${title}.org"
																										 "#+title: ${title}\n#+filetags: :MtG:MtG-Card:MtG-Card-Land:\n")
																	:dir-name "Games/MtG/Cards"
																	:unnarrowed t)


																 ;; People
																 ;; ------
																 ("P" "Templates for People")
																 ("PM" "People| Misc" plain "%?"
																	:if-new (file+head "People/Misc/${title}.org"
																										 "#+title: ${title}\n#+filetags: :Person:\n")
																	:dir-name "People/Misc"
																	:unnarrowed t)
																 ("PC" "People| Computing" plain "%?"
																	:if-new (file+head "People/Computing/${title}.org"
																										 "#+title: ${title}\n#+filetags: :Person:\n")
																	:dir-name "People/Computing"
																	:unnarrowed t)

																 )

		org-roam-dailies-directory (concat org-roam-directory "Journal/")
		org-roam-dailies-capture-templates '(
																				 ("j" "Journal" entry "* %?"
																					:if-new (file+head+olp "%<%Y>/%<%m>/%<%d>.org"
																																 "#+title: %<%Y-%m-%d>\n#+filetags: :Journal:%<%Y>:%<%B>:\n"
																																 ("Journal")))
																				 ("m" "Meeting" entry "* %?"
																					:if-new (file+head+olp "%<%Y-%m-%d>.org"
																																 "#+title: Meetings %<%Y-%m-%d>\n#+filetags: :Meeting:%<%Y>:%<%B>:\n"
																																 ("Agenda"))
																					:dir-name "Meetings")
																				 )


		;; Agenda
		org-deadline-warning-days 28
		org-agenda-span 10  ;; 10 days
		org-agenda-files '(
											 ;; "~/Documents/Org/Inbox.org"
											 "~/Documents/Org/Actionable.org"
											 "~/Documents/Org/Projects.org"
											 "~/Documents/Org/Projects/"
											 )
		org-agenda-time-grid '(
													 (weekly today require-timed)
													 (800 1000 1200 1400 1600 1800 2000)
													 ;; "......"
													 ;; "----------------"
													 "---"
													 "┈┈┈┈┈┈┈┈┈┈┈┈┈"
													 )
		org-agenda-category-icon-alist '(
																		 ("Teaching" ,(list (all-the-icons-faicon "graduation-cap" :height 0.8)) nil nil :ascent center)
																		 ("Family" ,(list (all-the-icons-faicon "home" :v-adjust 0.005)) nil nil :ascent center)
																		 ;; ("Producer" ,(list (all-the-icons-faicon "youtube-play" :height 0.9)) nil nil :ascent center)
																		 ;; ("Bard" ,(list (all-the-icons-faicon "music" :height 0.9)) nil nil :ascent center)
																		 ;; ("Stories" ,(list (all-the-icons-faicon "book" :height 0.9)) nil nil :ascent center)
																		 ("Author" ,(list (all-the-icons-faicon "pencil" :height 0.9)) nil nil :ascent center)
																		 ;; ("Gamedev" ,(list (all-the-icons-faicon "gamepad" :height 0.9)) nil nil :ascent center)
																		 ("Knowledge" ,(list (all-the-icons-faicon "database" :height 0.8)) nil nil :ascent center)
																		 ("Personal" ,(list (all-the-icons-material "person" :height 0.9)) nil nil :ascent center)
																		 ;; ("Org" "/path/to/icon.png" nil nil :ascent center)
																		 ;; ("Emacs" '(space . (:width (16))))
																		 )
		org-agenda-custom-commands '(
																 ("n" "Agenda and all TODOs" ((agenda "") (alltodo "")))

																 ("P" "Planning" (
																									(tags-todo "+Planning" (
																																					(org-agenda-overriding-header "Planning tasks")))
																									(tags-todo "-{.*}" (
																																			(org-agenda-overriding-header "Untagged tasks")))
																									))

																 ("p" "Project" tags-todo "+Project")

																 ;; Location-based
																 ("@h" "Home" tags-todo "+@home")
																 ("@w" "Work" tags-todo "+@work")
																 ("@s" "Shopping" tags-todo "+@shopping")

																 ;; Games
																 ("g" "MtG" tags-todo "+Gaming")
																 ("gm" "MtG" tags-todo "+MtG")
																 ("gcs" "MtG" tags-todo "+CounterStrike")
																 )
		org-super-agenda-groups '(
															;; Each group has an implicit boolean OR operator between its selectors.

															;; This is the first filter, anything found here
															;; will be placed in this group
															;; even if it matches following groups
															(:name " Overdue" ; Name
																		 :scheduled past ; Filter criteria
																		 :order 2 ; Order it should appear in agenda view
																		 :face 'error) ; Font face used for text

															;; This is the second filter, anything not found
															;; from the first filter, but found here,
															;; will be placed in this group
															;; even if it matches following groups
															(:name "Personal" ; Name
																		 :file-path "Personal" ; Filter criteria
																		 :order 3 ; Order it should appear in the agenda view
																		 :face 'error) ; Font faced used for text

															;; Third filter..
															(:name "Work"  ; Name
																		 :file-path "Work" ; Filter criteria
																		 :order 3 ; Order it should appear in the agenda view
																		 :face 'error) ; Font face used for text

															;; Fourth filter..
															(:name " Today "  ; Optionally specify section name
																		 :time-grid t ; Use the time grid
																		 :date today ; Filter criteria
																		 :scheduled today ; Another filter criteria
																		 :order 1 ; Order it should appear in the agenda view
																		 :face 'warning) ; Font face used for text
															)

		;; org-clock
		org-clock-out-remove-zero-time-clocks t

		;; Headings and lists
		;; org-todo
		;; https://hugocisneros.com/org-config/#setting-up-todo-keywords
		org-enforce-todo-dependencies t
		org-superstar-remove-leading-stars t
		org-priority-highest ?A
		org-priority-lowest ?C
		;; TODO: Try out numeric priority
		;; org-priority-highest 0
		;; org-priority-lowest 9
		org-todo-keywords '(
												;; Task
												(sequence "TODO(t)" "LATER(l)" "NEXT(n)" "|" "DONE(d)")
												;; Issue
												(sequence "REPORT(r)" "BUG(b)" "|" "FIXED(f)" "WONTFIX(x)" "WAI(w)")

												;; Article
												(sequence "READ?(r)" "UNREAD(R)" "READING(b)" "|" "READ!(d)")
												;; Audio
												(sequence "LISTEN?(l)" "LISTEN(L)" "LISTENING(b)" "|" "LISTENED(d)")
												;; Video
												(sequence "WATCH?(w)" "WATCH(W)" "WATCHING(b)" "|" "WATCHED(d)")

												;; Meeting
												(sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)")
												)
		org-modern-todo-faces '(
														;; Task
														("LATER" org-agenda-dimmed-todo-face)
														("TODO" org-priority)
														("NEXT" org-todo)
														("DONE" org-agenda-done)

														;; Issue
														("REPORT"  org-agenda-date)
														("BUG"     org-agenda-date-today)
														("FIXED"   org-agenda-done)
														("WONTFIX" org-agenda-done)
														("WAI"     org-agenda-done)

														;; Article
														("READ?" org-agenda-dimmed-todo-face)
														("UNREAD" org-priority)
														("READING" org-todo)
														("READ!" org-agenda-done)
														;; Audio
														("LISTEN?" org-agenda-dimmed-todo-face)
														("LISTEN" org-priority)
														("LISTENING" org-todo)
														("LISTENED" org-agenda-done)
														;; Video
														("WATCH?" org-agenda-dimmed-todo-face)
														("WATCH" org-priority)
														("WATCHING" org-todo)
														("WATCHED" org-agenda-done)

														;; Meeting
														("WAITING" org-agenda-date)
														("HOLD"    org-agenda-date)
														("CANCELLED" org-agenda-done)
														;; ("MEETING" :foreground "forest green" :weight bold)
														;; ("PHONE" :foreground "forest green" :weight bold)
														)
		org-todo-keyword-faces '(
														 ;; Task
														 ("LATER" org-agenda-dimmed-todo-face)
														 ("TODO" org-priority)
														 ("NEXT" org-todo)
														 ("DONE" org-agenda-done)

														 ;; Issue
														 ("REPORT"  org-agenda-date)
														 ("BUG"     org-agenda-date-today)
														 ("FIXED"   org-agenda-done)
														 ("WONTFIX" org-agenda-done)
														 ("WAI"     org-agenda-done)

														 ;; Article
														 ;; ("READ?" org-agenda-dimmed-todo-face)
														 ("UNREAD" org-priority)
														 ("READING" org-todo)
														 ("READ!" org-agenda-done)
														 ;; Audio
														 ;; ("LISTEN?" org-agenda-dimmed-todo-face)
														 ("LISTEN" org-priority)
														 ("LISTENING" org-todo)
														 ("LISTENED" org-agenda-done)
														 ;; Video
														 ;; ("WATCH?" org-agenda-dimmed-todo-face)
														 ("WATCH" org-priority)
														 ("WATCHING" org-todo)
														 ("WATCHED" org-agenda-done)

														 ;; Meeting
														 ("WAITING" org-agenda-date)
														 ("HOLD"    org-agenda-date)
														 ("CANCELLED" org-agenda-done)
														 ;; ("MEETING" :foreground "forest green" :weight bold)
														 ;; ("PHONE" :foreground "forest green" :weight bold)
														 )

		org-superstar-special-todo-items t  ;; Use ballot boxes instead of heading items
		org-superstar-todo-bullet-alist '(
																			;; Task
																			("TODO" . ?☐)
																			("NEXT" . ?🡆)
																			("DONE" . ?☑)

																			;; Issue
																			("REPORT" . ?🖺)
																			("BUG" . ?🪳)
																			("KNOWNCAUSE" . ?🪳)
																			("FIXED" . ?☑)
																			("WONTFIX" . ?☑)
																			("WAI" . ?☑)

																			;; Article
																			("UNREAD" . ?☐)
																			("READING" . ?☐)
																			("READ" . ?☑)
																			;; Video
																			("LISTEN" . ?☐)
																			("LISTENING" . ?☐)
																			("LISTENED" . ?☑)
																			;; Video
																			("WATCH" . ?☐)
																			("WATCHING" . ?☐)
																			("WATCHED" . ?☑)

																			;; Meeting
																			("WAITING" . ?☕)
																			("HOLD" . ?✰)
																			("CANCELLED" . ?✘)
																			)
		org-modern-tag-faces '(
													 ("emacs" :foreground "yellow")
													 )

		org-superstar-leading-bullet ?\s
		org-superstar-headline-bullets-list '(
																					"●"  ;; org-level-1 BLACK CIRCLE
																					"◉"  ;; org-level-2 FISHEYE
																					"○"  ;; org-level-3 WHITE CIRCLE
																					"⚪"  ;; org-level-4 MEDIUM WHITE CIRCLE
																					"⚪"  ;; org-level-5 MEDIUM WHITE CIRCLE
																					"⚪"  ;; org-level-6 MEDIUM WHITE CIRCLE
																					"⚪"  ;; org-level-7 MEDIUM WHITE CIRCLE
																					"⚪"  ;; org-level-8 MEDIUM WHITE CIRCLE
																					)
		org-superstar-item-bullet-alist '(
																			(?* . ?•)
																			(?+ . ?▶)
																			(?- . ?–)
																			)
		org-list-allow-alphabetical t

		;; org-superstar-mode fixes
		org-startup-indented t
		org-hide-leading-stars t

		;; HTTP
		org-enable-verb-support t

		;; HTML export
		org-enable-bootstrap-support t

		;; Reveal.js export
		org-enable-reveal-js-support t
		org-reveal-js "~/Projects/reveal.js/"
		org-src-fontify-natively t


		;; LaTeX export
		org-preview-latex-process-alist '("")
		org-preview-latex-process '("latexmk -synctex=1 -f -shell-escape -xelatex  %f"
																"lualatex -shell-escape -interaction nonstopmode %f")
		org-latex-pdf-process '("latexmk -synctex=1 -f -shell-escape -xelatex  %f"
														"lualatex -shell-escape -interaction nonstopmode %f")
		org-latex-listings 'minted
		org-latex-minted-options '(
															 ("frame"       "lines")
															 ("fontsize"    "\\scriptsize")
															 ("xleftmargin" "\\parindent")
															 ("linenos"     "")
															 )
		;; hugo (https://github.com/syl20bnr/spacemacs/tree/develop/layers/+emacs/org#hugo-support)
		org-enable-hugo-support t

		;; Babel
		;; https://orgmode.org/worg/org-contrib/babel/languages/index.html
		org-babel-load-languages '(
															 (emacs-lisp . t)

															 (sql . t)
															 (sqlite . t)

															 (C . t)  ;; C/C++/D
															 (rust . t)

															 (haskell . t)

															 (shell . t)
															 (nix . t)

															 (python . t)
															 (R . t)
															 (perl . t)

															 (http . t)
															 (css . t)
															 (js . t)

															 (dot . t)
															 (ditaa . t)
															 (latex . t)
															 )
		)
	 outshine ;; https://www.spacemacs.org/layers/+emacs/outshine/README.html

	 (nginx  ;; https://www.spacemacs.org/layers/+tools/nginx/README.html
		:variables
		)

	 ;; Markup languages
	 ;; https://www.spacemacs.org/layers/LAYERS.html#markup--configuration
	 asciidoc ;; https://www.spacemacs.org/layers/+lang/asciidoc/README.html
	 ;; (pdf-tools :variables  ;; https://www.spacemacs.org/layers/+tools/pdf-tools/README.html
	 ;;            )
	 csv ;; https://www.spacemacs.org/layers/+lang/csv/README.html
	 dhall
	 (html  ;; https://www.spacemacs.org/layers/+lang/html/README.html
		:variables
		web-fmt-tool 'prettier
		css-enable-lsp t
		html-enable-lsp t
		)
	 (json ;; https://www.spacemacs.org/layers/+lang/json/README.html
		:variables
		json-fmt-on-save t
		json-fmt-tool 'prettier
		json-backend 'lsp
		)
	 (jsonnet ;; https://www.spacemacs.org/layers/+lang/jsonnet/README.html
		:variables
		)
	 (latex ;; https://www.spacemacs.org/layers/+lang/latex/README.html
		:variables
		latex-backend 'lsp
		latex-refresh-preview t
		)
	 markdown
	 semantic-web ;; https://www.spacemacs.org/layers/+lang/semantic-web/README.html
	 (yaml ;; https://www.spacemacs.org/layers/+lang/yaml/README.html
		:variables
		yaml-enable-lsp t
		)
	 copy-as-format ;; https://www.spacemacs.org/layers/+misc/copy-as-format/README.html

	 (colors  ;; https://www.spacemacs.org/layers/+themes/colors/README.html
		:variables
		;; colorize identifiers
		colors-colorize-identifiers 'all
		colors-default-rainbow-identifiers-sat 42
		colors-default-rainbow-identifiers-light 86
		)
	 (unicode-fonts ;;  https://www.spacemacs.org/layers/+fonts/unicode-fonts/README.html
		:variables
		unicode-fonts-enable-ligatures t)
	 (emoji  ;; https://www.spacemacs.org/layers/+fun/emoji/README.html
		:variables
		)

	 (shell
		:variables
		shell-default-shell 'eshell
		shell-default-height 30
		shell-default-position 'bottom
		)
	 (ranger
		:variables
		ranger-show-preview t)

	 (cmake  ;; https://www.spacemacs.org/layers/+tools/cmake/README.html
		:variables
		cmake-backend 'lsp
		)


	 (erc  ;; https://www.spacemacs.org/layers/+chat/erc/README.html
		:variables
		erc-server-list '(
											("irc.libera.chat"  ;; "irc.ipv6.libera.chat"
											 :port "6697"
											 :ssl t
											 ;; ERC will check your ~/.authinfo.gpg, looking for lines like
											 ;;   machine <irc.server.url> login <YOUR_NICKNAME> password <YOUR_PASSWORD> port <PORT_NUMBER>
											 :nick "Dietr1ch"
											 )
											("irc.freenode.net"
											 :port "6697"
											 :ssl t
											 :nick "Dietr1ch"
											 )
											)
		)

	 )  ;; setq-default dotspacemacs-configuration-layers

 dotspacemacs-additional-packages
 '(
	 treesit-auto

	 all-the-icons

	 titlecase

	 writeroom-mode
	 writegood-mode

	 olivetti

	 gptel
	 mcp

	 openwith
	 dired-open-with

	 request
	 request-deferred

	 ;; org-roam
	 websocket
	 simple-httpd
	 ;; (org-roam :location (recipe :fetcher github
	 ;;                             ;; https://github.com/org-roam/org-roam
	 ;;                             :branch "main"
	 ;;                             :repo "org-roam/org-roam"
	 ;;                             :files (:defaults "extensions/org-roam-dailies.el")))
	 ob-rust
	 ob-nix
	 ob-http
	 org-alert
	 (org-roam-ui
		:location (recipe
							 :fetcher github
							 ;; https://github.com/org-roam/org-roam-ui
							 :branch "main"
							 :repo "org-roam/org-roam-ui"))

	 ;; Music
	 (eems
		:location (recipe
							 :fetcher git
							 :url "https://git.savannah.gnu.org/git/emms.git"))

	 gptel-magit
	 magit-annex
	 magit-stats
	 helm-rg

	 mpdel

	 quarto-mode

	 pdf-tools
	 ;; org-pdftools
	 ;; org-noter-pdftools

	 tree-sitter-ispell

	 ;; File formats
	 fish-mode
	 protobuf-mode
	 capnp-mode
	 janet-mode
	 just-mode
	 just-ts-mode

	 qrencode

	 scad-mode

	 unison-mode
	 sparql-mode

	 doom-themes

	 2048-game

	 http

	 leetcode
	 )  ;; setq-default dotspacemacs-additional-packages
 ) ;; setq-default
