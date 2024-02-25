;;; np-popper.el --- Basics -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package popper
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "\\*Warnings\\*"
          "\\*Compile-Log\\*"
          "\\*Help\\*"
          "\\*Backtrace\\*"
          "\\*Apropos\\*"
          "\\*cargo-test\\*"))
  :config
  (popper-mode +1))

(provide 'np-popper)
;;; popper.el ends here
