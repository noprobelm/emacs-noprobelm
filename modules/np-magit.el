;;; np-magit.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package
  magit)

(use-package diff-hl
  :hook
  (prog-mode . diff-hl-mode)
  (prog-mode . diff-hl-flydiff-mode)
  (prog-mode . diff-hl-show-hunk-mouse-mode)
  (window-state-change . diff-hl-update))

(provide 'np-magit)
;;; np-magit.el ends here.
