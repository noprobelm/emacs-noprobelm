;;; np-theme.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(defun disable-all-themes ()
  "Disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))

(use-package doom-themes
  :straight t)

(load-theme 'doom-vibrant t)

(provide 'np-theme)
;;; np-theme.el ends here.
