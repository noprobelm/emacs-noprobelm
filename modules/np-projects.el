;;; np-projects.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package projectile
  :straight t
  :config
  (projectile-mode 1)
  (setq projectile-completion-system 'helm)
  (setq projectile-indexing-method 'alien)
  (setq projectile-sort-order 'recently-active))

(use-package helm-projectile
  :straight t
  :after projectile
  :init
  (defun np/switch-project ()
  (interactive)
  (add-function :before '(helm-projectile-switch-project) #'tab-bar-new-tab)))

(use-package counsel-projectile
  :straight t
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
	   "* TODO %?\n\ntodo recorded at %U")
	  )))

(provide 'np-projects)
;;; np-projects.el ends here.
