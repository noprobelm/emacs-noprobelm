;;; np-environment.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package exec-path-from-shell
  :init
  (setq exec-path-from-shell-variables '("PATH"))
  (exec-path-from-shell-initialize))

(use-package envrc
  :config
  (envrc-global-mode))
(provide 'np-environment)
;;; np-environment.el ends here.
