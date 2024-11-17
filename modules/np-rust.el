;;; np-rust.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(add-hook 'rust-ts-mode-hook 'eglot-ensure)

(use-package ron-mode)

(provide 'np-rust)
;;; np-rust.el ends here.
