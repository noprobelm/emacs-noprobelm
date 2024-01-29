;;; np-dashboard.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package dashboard
  :straight t
  :config
  ;; Setup post initialization dashboard hooks.
  (dashboard-setup-startup-hook)
	(setq dashboard-banner-logo-title
	      "Noprobelm's Dashboard\ntest")
	(setq dashboard-banner-logo-title
	      (format "Emacs ready in %.2f seconds with %d garbage collections."
		      (float-time (time-subtract after-init-time before-init-time)) gcs-done))
	(setq dashboard-startup-banner "~/.emacs.noprobelm/images/volo.png")
	(setq dashboard-image-banner-max-height 600)
	(setq dashboard-image-banner-max-width 900)
	(setq dashboard-items '((recents  . 5)
				(bookmarks . 5)
				(projects . 5)
				(agenda . 5)
				))

(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-center-content t)

  (defun dashboard-refresh-buffer-silent ()
    "Refresh buffer in background."
    (interactive)
    (let ((dashboard-force-refresh t)) (dashboard-insert-startupify-lists)))

  (defun dashboard-switch ()
    (interactive)
    "Switch to dashboard buffer"
    (switch-to-buffer dashboard-buffer-name))

  (setq dashboard-set-navigator t)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))

(provide 'np-dashboard)
;;; np-dashboard.el ends here.
