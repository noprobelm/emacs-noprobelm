;;; np-wakatime.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package wakatime-mode
  :init
  (setq wakatime-cli-path "/usr/bin/wakatime-cli")
  :config
  (global-wakatime-mode))

(provide 'np-wakatime)
;;; np-wakatime.el ends here.
