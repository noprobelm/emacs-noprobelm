;;; np-cpp.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; https://www.emacswiki.org/emacs/CPlusPlusMode for better setup options
(use-package cpp
  :ensure nil
  :after eglot
  :init
  (add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))
  (add-hook 'c-mode-hook #'eglot-ensure)
  (add-hook 'c-ts-mode-hook #'eglot-ensure)
  (add-hook 'c++-mode-hook #'eglot-ensure)
  (add-hook 'c++-ts-mode-hook #'eglot-ensure))

(provide 'np-cpp)
;;; np-cpp.el ends here.
