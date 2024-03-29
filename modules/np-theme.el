;;; np-theme.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(defun disable-all-themes ()
  "Disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(use-package doom-themes
  :config
  (load-theme 'doom-gruvbox t))

(provide 'np-theme)
;;; np-theme.el ends here.
