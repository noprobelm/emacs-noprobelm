;;; np-treesitter.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(use-package treesit
  :ensure nil
  :commands (treesit-install-language-grammar)
  :init
  ;; https://www.nathanfurnal.xyz/posts/building-tree-sitter-langs-emacs/
  (setq treesit-language-source-alist
        '((bash . ("https://github.com/tree-sitter/tree-sitter-bash"))
          (c . ("https://github.com/tree-sitter/tree-sitter-c"))
          (cpp . ("https://github.com/tree-sitter/tree-sitter-cpp"))
          (css . ("https://github.com/tree-sitter/tree-sitter-css"))
          (go . ("https://github.com/tree-sitter/tree-sitter-go"))
          (html . ("https://github.com/tree-sitter/tree-sitter-html"))
          (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
          (json . ("https://github.com/tree-sitter/tree-sitter-json"))
          (lua . ("https://github.com/Azganoth/tree-sitter-lua"))
          (make . ("https://github.com/alemuller/tree-sitter-make"))
          (ocaml . ("https://github.com/tree-sitter/tree-sitter-ocaml" "ocaml/src" "ocaml"))
          (python . ("https://github.com/tree-sitter/tree-sitter-python"))
          (php . ("https://github.com/tree-sitter/tree-sitter-php"))
          (ruby . ("https://github.com/tree-sitter/tree-sitter-ruby"))
          (rust . ("https://github.com/tree-sitter/tree-sitter-rust"))
          (sql . ("https://github.com/m-novikov/tree-sitter-sql"))
          (toml . ("https://github.com/tree-sitter/tree-sitter-toml"))
          (yaml . ("https://github.com/panekj/tree-sitter-yaml"))
          (zig . ("https://github.com/GrayJack/tree-sitter-zig"))))

  (setq major-mode-remap-alist
        '((sh-mode         . bash-ts-mode)
          (c-mode          . c-ts-mode)
          (c++-mode        . c++-ts-mode)
          (cmake-mode      . cmake-ts-mode)
          (css-mode        . css-ts-mode)
          (dockerfile-mode . dockerfile-ts-mode)
          (go-mode         . go-ts-mode)
          (java-mode       . java-ts-mode)
          (javascript-mode . js-ts-mode)
          (js-json-mode    . json-ts-mode)
          (python-mode     . python-ts-mode)
          (ruby-mode       . ruby-ts-mode)
          (rust-mode       . rust-ts-mode)
          (conf-toml-mode  . toml-ts-mode)
          (rjsx-mode       . tsx-ts-mode)
          (typescript-mode . typescript-ts-mode)
          (yaml-mode       . yaml-ts-mode)))
  )

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package tree-sitter
  :if (and (version< emacs-version "29")
           (string= "x86_64" (car (split-string system-configuration "-")))))

(use-package treesit-auto
  :custom
  (treesit-auto-install 'prompt)
  :config
  (global-treesit-auto-mode))

(provide 'np-treesitter)

;;; np-treeritter.el ends here.
