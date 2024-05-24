;;; np-copilot.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package jsonrpc :ensure t)

(use-package s
  :ensure (:host github :repo "magnars/s.el")
  ;; :files ("s.el"))
  )

(use-package dash
    :ensure (:host github :repo "magnars/dash.el");; :files ("dash.el"))
    )

(use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))

(use-package copilot
  :disabled
  :ensure (:host github :repo "copilot-emacs/copilot.el" :files ("dist" "*.el"))
  :hook ((prog-mode . copilot-mode) (org-mode . copilot-mode))
  :init
  (setq copilot-indent-offset-warning-disable t)
  :config
  (add-to-list 'copilot-indentation-alist '(org-mode 2)))

(provide 'np-copilot)
;;; np-copilot.el ends here.
