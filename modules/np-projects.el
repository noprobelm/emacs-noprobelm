;;; np-projects.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package bufler
  :init
  (bufler-mode 1)
  :config
  (custom-set-variables '(bufler-workspace-prefix-abbreviation '("\\`Workspace: " . ""))))

(use-package tab-bar
  :elpaca nil
  :init
  (tab-bar-mode)
  (tab-bar-rename-tab "Default" 1)
  (setq tab-bar-auto-width nil)
  :config
  (defun np/new-tab ()
    (interactive)
    (tab-bar-new-tab-to -1))

  (defun np/close-tab ()
    (interactive)
    (if (project-current) (project-kill-buffers))
    (tab-bar-close-tab))

  (defun np/rename-tab ()
    (let ((project-name (concat (projectile-project-name) ": "))
          (file-name (file-name-nondirectory buffer-file-name)))
      (put-text-property 0 (length project-name) 'face 'font-lock-keyword-face project-name)
      (put-text-property 0 (length file-name) 'face 'font-lock-function-name-face file-name)
      (tab-rename (concat project-name file-name))))

  (add-hook 'find-file-hook 'np/rename-tab)
  (advice-add 'bufler-switch-buffer :after (lambda (&rest _) (np/rename-tab))))

(use-package projectile
  :init
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien)
  (setq projectile-sort-order 'recently-active)
  (defun np/switch-project ()
    (interactive)
    (let ((selection (helm :sources (helm-build-sync-source "Projectile Projects"
                                      :candidates projectile-known-projects
                                      :fuzzy-match t)
                           :buffer "*helm test*")))
      (when selection (tab-bar-new-tab-to -1)
            (projectile-switch-project-by-name selection)
            (bufler-workspace-focus-buffer (current-buffer))
            )))
  :config
  (projectile-mode 1))

(use-package helm-projectile
  :after projectile)

(use-package counsel-projectile
  :after (projectile org)
  :init
  (setq +org-capture-todo-file "~/workshop/org/todo.org")
  (setq +org-capture-ideas-file "~/workshop/org/ideas.org")
  (setq +org-capture-projects-file "~/workshop/org/projects.org")
  (setq counsel-projectile-org-capture-templates
 	'(("w" "Work todo"
	   entry (id "0865f88a-3f18-4cb7-b1a1-2fc127e3d607")
	   "* TODO %?%^g\n\ntodo recorded at %U")
	  ("p" "Personal todo"
	   entry (id "0f14b951-5ef9-4049-8bf8-a7dcd276265e")
	   "* TODO %?%^G\n\ntodo recorded at %U")
	  ("a" "Appointment"
	   entry (id "2a7a427f-cd10-4a31-8ffc-94928e550ea1")
	   "* APPT %? %^G")
	  ("i" "Idealogue"
	   entry (id "f8fb678e-d796-4a0e-8c74-e114b115d012")
	   "* IDEA %?%^g\n\ntodo recorded at %U")
	  ("t" "${name} todo" entry
	   (file+headline +org-capture-projects-file "${name}")
	   "* TODO %?%^g\n\ntodo recorded at %U\n\n%a")
	  ("g" "General Project todo" entry
	   (file+headline +org-capture-projects-file "General TODO items")
	   "* TODO %?\n\ntodo recorded at %U"))))

(provide 'np-projects)
;;; np-projects.el ends here.
