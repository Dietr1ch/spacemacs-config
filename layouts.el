(spacemacs|define-custom-layout "Org"
	:binding "o"
	:body
	(treemacs-do-switch-workspace "Org")

	(find-file "~/Notes/Actionable.org")

	(split-window-right-and-focus)
	(find-file "~/Notes/Inbox.org")

	(org-agenda-list)
	)

(spacemacs|define-custom-layout "Emacs"
	:binding "e"
	:body
	(treemacs-do-switch-workspace "Emacs")

	(find-file "~/.config/spacemacs/config/init.el")
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

	(helm-projectile-switch-project)
	)

(spacemacs|define-custom-layout "Blog"
	:binding "b"
	:body
	(treemacs-do-switch-workspace "Blog")

	(find-file "~/Notes/Personal/Blog/TODOs.org")
	(split-window-right-and-focus)
	(find-file "~/Notes/Personal/Blog/index.html")
	)
