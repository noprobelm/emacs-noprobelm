;;; np-environment.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package exec-path-from-shell
  :straight t
  :init
  (setq exec-path-from-shell-variables '("PATH"))
  (exec-path-from-shell-initialize))

(provide 'np-environment)
;;; np-environment.el ends here.
