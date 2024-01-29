;;; np-tab-bar.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package tab-bar
  :straight nil
  :init
  (setopt tab-bar-show 1)
  (tab-bar-mode)
  (tab-bar-rename-tab "Default" 1)

  :config
  (defun close-tab ()
    (interactive)
    (if (project-current) (project-kill-buffers))
    (tab-bar-close-tab)))

(provide 'np-tab-bar)
;;; np-tab-bar.el ends here.
