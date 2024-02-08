;;; np-dashboard.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package dashboard
  :init
  ;; Setup post initialization dashboard hooks.
  (dashboard-setup-startup-hook)

  (setq
   dashboard-banner-logo-title
   (format "Emacs ready in %.2f seconds with %d garbage collections."
           (float-time (time-subtract after-init-time before-init-time)) gcs-done)
   dashboard-startup-banner "~/.emacs.noprobelm/banners/ue-colorful.png"
   dashboard-image-banner-max-height 600
   dashboard-image-banner-max-width 900
   dashboard-set-heading-icons t
   dashboard-set-file-icons t
   dashboard-center-content t
   dashboard-set-navigator t
   dashboard-items '((recents  . 5)
                     (bookmarks . 5)
		     (projects . 5)
		     (agenda . 5)))

  (setq initial-buffer-choice #'dashboard-open)

  (defun dashboard-refresh-buffer-silent ()
    "Refresh buffer in background."
    (interactive)
    (let ((dashboard-force-refresh t))
      (dashboard-insert-startupify-lists)))

  (defun dashboard-switch ()
    "Switch to dashboard buffer"
    (interactive)
    (switch-to-buffer dashboard-buffer-name)))

(provide 'np-dashboard)
;;; np-dashboard.el ends here.
