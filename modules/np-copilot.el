;;; np-copilot.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (use-package editorconfig)


;; (add-to-list 'load-path "/home/noprobelm/.emacs.noprobelm/elpaca/repos/copilot/")

(use-package jsonrpc
  :demand t
  :elpaca (:package "jsonrpc"
  ;; Inherited from declaration.
  :depth 1
  :inherit t
  :protocol https
  :source "GNU ELPA"
  :files ("lisp/jsonrpc.el" (:exclude
			     ".git"))
  :branch "master"
  :local-repo "jsonrpc"
  :repo "https://github.com/emacs-mirror/emacs"))

  (use-package s
    :elpaca (:host github :repo "magnars/s.el");; :files ("s.el"))
    :ensure t)

  (use-package dash
    :elpaca (:host github :repo "magnars/dash.el");; :files ("dash.el"))
    :ensure t)

  (use-package editorconfig
    :ensure t
    :config
    (editorconfig-mode 1))

(use-package copilot
  :elpaca (:host github :repo "copilot-emacs/copilot.el" :files ("dist" "*.el"))
  :hook ((prog-mode . copilot-mode) (org-mode . copilot-mode))
  :config (add-to-list 'copilot-indentation-alist '(org-mode 2))
  :ensure t)

(provide 'np-copilot)
;;; np-copilot.el ends here.
