;;; np-modeline.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package doom-modeline
  :hook (doom-modeline-mode . (lambda () (doom-modeline-set-modeline 'np/main-line 'default)))
  :config
  (doom-modeline-def-modeline 'np/main-line
  '(bar buffer-info vcs remote-host parrot selection-info buffer-position)
  '(major-mode process checker time battery))

  (add-to-list 'doom-modeline-mode-alist '(prog-mode . np/main-line))
  :init
  (display-time-mode 1)
  (display-battery-mode 1)
  (setq doom-modeline-height 25)
  (setq doom-modeline-bar-width 1)
  (setq doom-modeline-icon t)
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-file-name-style 'file-name)
  (setq doom-modeline-buffer-state-icon t)
  (setq doom-modeline-buffer-modification-icon t)
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-enable-word-count nil)
  (setq doom-modeline-indent-info nil)
  (setq doom-modeline-checker-simple-format t)
  (setq doom-modeline-vcs-max-length 12)
  (setq doom-modeline-env-version t)

  (doom-modeline-mode 1))

(provide 'np-modeline)
;;; np-modeline.el ends here.
