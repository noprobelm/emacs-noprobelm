;;; init.el --- noprobelm's init.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(setq byte-compile-warnings nil)
(defconst np/config-dir (file-truename (expand-file-name user-emacs-directory)))
(defconst np/module-dir (expand-file-name "modules" np/config-dir))
(setq custom-file (expand-file-name "custom.el" np/config-dir))

(defun straight-bootstrap ()
  "Run the bootstrap code for straight."
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage)))

(defun np/try-load-file (file &optional dir)
  "Load FILE at DIR if it exists.
If DIR is not provided, default to np/module-dir."
  (let ((file (expand-file-name file (or dir np/config-dir))))
    (when (file-exists-p file)
      (load-file file))))

(defun np/open-module (module)
  "Open a MODULE."
  (interactive
   (list (completing-read "Module: "
                          (mapcar #'file-name-base
                                  (directory-files-recursively np/module-dir ".el$" nil))
                          nil t)))

  (let ((matches (seq-filter
                  (lambda (file) (string-match (concat module ".el$") file))
                  (directory-files-recursively np/module-dir ".el$" nil))))
    (if (= 1 (length matches))
        (find-file (car matches))
      (user-error "Module not found: %s" module))))

(straight-bootstrap)
(straight-use-package 'org)

(load custom-file nil)
(np/try-load-file "modules.el" np/config-dir)
;; local.el is an untracked / .gitignored file. Load it if it exists
(np/try-load-file "local.el")
;;; init.el ends here.
