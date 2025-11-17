;; Org

;; (cl-defmethod org-roam-node-hierarchy ((node org-roam-node))
;; 	(let ((level (org-roam-node-level node)))
;; 		(concat
;; 		 (when (> level 0) (concat (org-roam-node-file-title node) " > "))
;; 		 (when (> level 1) (concat (string-join (org-roam-node-olp node) " > ") " > "))
;; 		 (org-roam-node-title node))))
;; (setq org-roam-node-display-template "${hierarchy:*} ${tags:30}")

;; GPTel
(setf (alist-get 'org-mode gptel-prompt-prefix-alist) "@user\n")
(setf (alist-get 'org-mode gptel-response-prefix-alist) "@assistant\n")


(add-hook 'org-mode-hook
					(lambda ()
						(setq indent-tabs-mode nil)
						(setq tab-width 8)
						(setq prettify-symbols-alist '(
																					 ;; Ideas:
																					 ;; https://old.reddit.com/r/emacs/comments/brt0sk/prettifysymbolsmode_is_so_cool/
																					 ("[ ]" . "☐")  ;; BALLOT BOX
																					 ("[X]" . "☑")  ;; BALLOT BOX WITH CHECK
																					 ("[-]" . "❍")  ;; SHADOWED WHITE CIRCLE
																					 ;; ("-+-" . "┼")  ;; BOX DRAWINGS LIGHT VERTICAL AND HORIZONTAL
																					 )))
					)  ;; add-hook 'org-mode-hook


;; org-mode - org-present
;; System crafters presentation: ~/Documents/Org/Articles/20241229093831-systemcrafters_presentations_with_org_present.org
;; TODO: Check if this really helps presenting. I think new defaults or spacemacs makes this a no-op
(defun my/org-present-start ()
	;; Center the presentation and wrap lines
	(visual-fill-column-mode 1)
	(visual-line-mode 1)
	)
(add-hook 'org-present-mode-hook 'my/org-present-start)
(defun my/org-present-end ()
	;; Stop centering the document
	(visual-fill-column-mode 0)
	(visual-line-mode 0)
	)
(add-hook 'org-present-mode-quit-hook 'my/org-present-end)


(spaceline-toggle-org-clock-on)
(spaceline-toggle-org-pomodoro-on)

;; gtd
(defun gtd/inbox ()
	(interactive)
	(find-file-other-window "~/Documents/Org/Inbox.org")
	)  ;; defun gtd/inbox ()
(defun gtd/actionable ()
	(interactive)
	(find-file-other-window "~/Documents/Org/Actionable.org")
	)  ;; defun gtd/actionable ()
(defun gtd/tickler ()
	(interactive)
	(find-file-other-window "~/Documents/Org/Tickler.org")
	)  ;; defun gtd/tickler ()
(defun gtd/wishlist ()
	(interactive)
	(find-file-other-window "~/Documents/Org/Wishlist.org")
	)  ;; defun gtd/wishlist ()
(spacemacs/set-leader-keys
	"<DEL> g i" 'gtd/inbox
	"<DEL> g a" 'gtd/actionable
	"<DEL> g t" 'gtd/tickler
	"<DEL> g w" 'gtd/wishlist
	)  ;; spacemacs/set-leader-keys


(defun org-roam-node-filter/mtg (node)
	(let ((tags (org-roam-node-tags node)))
		(or
		 (member "MtG" tags)
		 (member "MtG-Card" tags)
		 ))
	)  ;; defun org-roam-node-filter/mtg (node)
(defun org-roam-node-find/mtg ()
	(interactive)
	(org-roam-node-find t nil 'org-roam-node-filter/mtg)
	)  ;; defun org-roam-node-find/mtg ()

(defun org-roam-node-filter/default (node)
	(let ((tags (org-roam-node-tags node)))
		(not
		 (or
			(member "Time" tags)
			(member "MtG-Card" tags)
			(member "MtG-Meta" tags)
			)))
	)  ;; defun org-roam-node-filter/default (node)

(defun org-roam-node-find/default ()
	(interactive)
	(org-roam-node-find t nil 'org-roam-node-filter/default)
	)  ;; defun org-roam-node-find/default ()


(spacemacs/set-leader-keys
	"<DEL> <DEL>" 'org-roam-node-find/default
	"-" 'org-roam-node-find/default
	"i r" 'org-roam-node-insert
	"<DEL> O" 'org-mode

	;; Roam
	"<DEL> r f"   'org-roam-node-find/default
	"<DEL> r F F" 'org-roam-node-find
	"<DEL> r F m" 'org-roam-node-find/mtg
	"<DEL> r F t" 'org-roam-node-find/time
	"<DEL> r i"   'org-roam-node-insert

	"<DEL> r s"   'org-roam-db-sync
	"<DEL> r g"   'org-roam-ui-mode
	"<DEL> r c"   'org-id-get-create
	"<DEL> r C"   'org-roam-extract-subtree
	"<DEL> r b"   'org-roam-buffer-toggle

	;; Journal
	"<DEL> j t" 'org-roam-dailies-goto-today
	"<DEL> j T" 'org-roam-dailies-goto-date
	"<DEL> j n" 'org-roam-dailies-goto-tomorrow
	"<DEL> j p" 'org-roam-dailies-goto-yesterday
	"<DEL> J T" 'org-roam-dailies-capture-today
	"<DEL> J N" 'org-roam-dailies-capture-tomorrow
	"<DEL> J P" 'org-roam-dailies-capture-yesterday
	)  ;; spacemacs/set-leader-keys

(spacemacs|define-custom-layout "@Org"
	:binding "o"
	:body
	(winum-select-window-1)
	(find-file "~/Documents/Org/Actionable.org")

	(split-window-right) ;; Create the right side (but don't move focus)
	(winum-select-window-2) ;; Go to the right window
	(find-file "~/Documents/Org/Inbox.org")

	(org-agenda-list)
	)
