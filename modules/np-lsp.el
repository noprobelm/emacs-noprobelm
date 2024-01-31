;;; np-lsp.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package eglot
  :requires jsonrpc
  :init
  (setq eglot-stay-out-of '(eldoc))

  :config
  (defun eglot-rename (newname)
    "Rename the current symbol to NEWNAME."
    (interactive
     (list (read-from-minibuffer
            (format "Rename `%s' to: " (or (thing-at-point 'symbol t)
                                           "unknown symbol"))
            (symbol-name (symbol-at-point))
            nil nil nil
            (symbol-name (symbol-at-point)))))
    (eglot--server-capable-or-lose :renameProvider)
    (eglot--apply-workspace-edit
     (jsonrpc-request (eglot--current-server-or-lose)
                      :textDocument/rename `(,@(eglot--TextDocumentPositionParams)
                                             :newName ,newname))
     current-prefix-arg)))
(provide 'np-lsp)
;;; np-lsp.el ends here.
