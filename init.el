;;; init.el --- noprobelm's init.el -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:
(setq byte-compile-warnings nil)
(defconst np/config-dir (file-truename (expand-file-name user-emacs-directory)))
(defconst np/module-dir (expand-file-name "modules" np/config-dir))
(setq custom-file (expand-file-name "custom.el" np/config-dir))

(defvar elpaca-installer-version 0.7)
(defvar elpaca-directory (expand-file-name "elpaca/" user-emacs-directory))
(defvar elpaca-builds-directory (expand-file-name "builds/" elpaca-directory))
(defvar elpaca-repos-directory (expand-file-name "repos/" elpaca-directory))
(defvar elpaca-order '(elpaca :repo "https://github.com/progfolio/elpaca.git"
                              :ref nil
                              :files (:defaults "elpaca-test.el" (:exclude "extensions"))
                              :build (:not elpaca--activate-package)))
(let* ((repo  (expand-file-name "elpaca/" elpaca-repos-directory))
       (build (expand-file-name "elpaca/" elpaca-builds-directory))
       (order (cdr elpaca-order))
       (default-directory repo))
  (add-to-list 'load-path (if (file-exists-p build) build repo))
  (unless (file-exists-p repo)
    (make-directory repo t)
    (when (< emacs-major-version 28) (require 'subr-x))
    (condition-case-unless-debug err
        (if-let ((buffer (pop-to-buffer-same-window "*elpaca-bootstrap*"))
                 ((zerop (call-process "git" nil buffer t "clone"
                                       (plist-get order :repo) repo)))
                 ((zerop (call-process "git" nil buffer t "checkout"
                                       (or (plist-get order :ref) "--"))))
                 (emacs (concat invocation-directory invocation-name))
                 ((zerop (call-process emacs nil buffer nil "-Q" "-L" "." "--batch"
                                       "--eval" "(byte-recompile-directory \".\" 0 'force)")))
                 ((require 'elpaca))
                 ((elpaca-generate-autoloads "elpaca" repo)))
            (progn (message "%s" (buffer-string)) (kill-buffer buffer))
          (error "%s" (with-current-buffer buffer (buffer-string))))
      ((error) (warn "%s" err) (delete-directory repo 'recursive))))
  (unless (require 'elpaca-autoloads nil t)
    (require 'elpaca)
    (elpaca-generate-autoloads "elpaca" repo)
    (load "./elpaca-autoloads")))
(add-hook 'after-init-hook #'elpaca-process-queues)
(elpaca `(,@elpaca-order))

(elpaca elpaca-use-package
  ;; Enable :elpaca use-package keyword.
  (elpaca-use-package-mode)
  ;; Assume :elpaca t unless otherwise specified.
  (setq elpaca-use-package-by-default t))

;; Block until current queue processed.
(elpaca-wait)

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


(load custom-file nil)
(np/try-load-file "modules.el" np/config-dir)
;; local.el is an untracked / .gitignored file. Load it if it exists
(np/try-load-file "local.el")
;;; init.el ends here.
