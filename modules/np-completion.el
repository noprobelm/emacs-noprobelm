;;; np-completion.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package helm
  :config
  (helm-mode 1))

(use-package corfu
  :elpaca (:files (:defaults "extensions/corfu-info.el" "extensions/corfu-history.el" "extensions/corfu-popupinfo.el"))
  :hook
  (prog-mode . corfu-mode)
  (text-mode . corfu-mode)
  :init
  (setq corfu-auto t)
  (setq corfu-auto-delay 0.2)
  (setq corfu-auto-prefix 1)
  (setq corfu-popupinfo-delay 0.5))

(use-package kind-icon
  :after corfu
  :init
  (setq kind-icon-default-face 'corfu-default)
  (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))

(use-package all-the-icons
  :demand t)

(use-package all-the-icons-completion
  :demand t
  :after all-the-icons
  :init
  (all-the-icons-completion-mode))

(use-package all-the-icons-dired
  :after all-the-icons
  :init
  (add-hook 'dired-mode-hook #'all-the-icons-dired-mode))

(provide 'np-completion)
;;; np-completion.el ends here.
