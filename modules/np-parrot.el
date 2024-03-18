;;; np-parrot.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package parrot
  :config
  (add-to-list 'parrot-rotate-dict
               '(:rot ("&&" "||")))
  (parrot-mode))

(provide 'np-parrot)
;;; np-parrot.el ends here.
