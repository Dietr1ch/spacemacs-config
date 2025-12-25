(spacemacs|define-custom-layout "Org"
	:binding "o"
	:body
	(treemacs-do-switch-workspace "Org")

	(find-file "~/Documents/Org/Actionable.org")

	(split-window-right-and-focus)
	(find-file "~/Documents/Org/Inbox.org")

	(org-agenda-list)
	)

(spacemacs|define-custom-layout "Emacs"
	:binding "e"
	:body
	(treemacs-do-switch-workspace "Emacs")

	(find-file "~/.config/emacs/spacemacs-dev/config/init.el")
	)

(spacemacs|define-custom-layout "Nix"
	:binding "s"
	:body
	(treemacs-do-switch-workspace "Nix")

	(find-file "~/.config/home-manager/home.nix")

	(split-window-right-and-focus)
	(dired "~/.config/home-manager/home/")
	)

(spacemacs|define-custom-layout "Projects"
	:binding "p"
	:body
	(treemacs-do-switch-workspace "Projects")

	(dired "~/Projects/")
	)
