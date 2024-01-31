;;; np-python.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package python
  :elpaca nil
  :after eglot
  :init
  (add-hook 'python-base-mode-hook #'eglot-ensure)
  (add-hook 'python-base-mode-hook (lambda ()
			             (setq python-shell-completion-native-enable nil)
			             (setq python-indent-guess-indent-offset t)
			             (setq python-indent-guess-indent-offset-verbose nil)
			             (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

  (add-to-list 'eglot-server-programs
               '(python-base-mode . ("pylsp")))

  (setq-default eglot-workspace-configuration
                '((:pylsp . ( :configurationSources ["flake8"]
                              :plugins ( :pycodestyle (:enabled nil)
                                         :mccabe (:enabled nil)
                                         :flake8 (:enabled t)))))))


(use-package pyvenv-auto
  :after python
  :demand t
  :config
  (add-hook 'python-base-mode-hook #'pyvenv-auto-run))



(use-package apheleia
  :after python
  :init
  (add-hook 'python-base-mode-hook #'apheleia-mode)
  (evil-define-key* 'normal python-base-mode-map
    (kbd "<leader> m f") #'("format" . apheleia-format-buffer)))

(use-package poetry)

(provide 'np-python)
;;; np-python.el ends here.
