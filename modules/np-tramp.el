;;; np-tramp.el --- TRAMP -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package tramp
  :ensure nil
  :init
  (setq debug-ignored-errors
        (cons 'remote-file-error debug-ignored-errors))

  (setopt tramp-default-method "ssh")
  (setopt tramp-inline-compress-start-size 1000000)
  (setopt tramp-verbose 1)
  (setopt tramp-ssh-controlmaster-options
          (concat
           "-o ControlPath=/tmp/ssh-ControlPath-%%r@%%h:%%p "
           "-o ControlMaster=auto -o ControlPersist=yes"
           ))
  (setopt tramp-use-ssh-controlmaster-options t)
  (setopt tramp-default-method "scp")
  (setopt vc-ignore-dir-regexp
          (format "\\(%s\\)\\|\\(%s\\)"
                  vc-ignore-dir-regexp
                  tramp-file-name-regexp))
  (setopt remote-file-name-inhibit-locks t))

(provide 'np-tramp)
;; np-tramp.el ends here.
