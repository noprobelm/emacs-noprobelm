;;; np-general.el --- Modules -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package general
  :straight t
  :init
  (general-create-definer spc-leader-key
    :states '(normal visual)
    :prefix "SPC")
  (spc-leader-key :states '(normal visual)
    ;; General
    ":" '(helm-M-x :wk "M-x")
    "X" '(counsel-projectile-org-capture :wk "Org Capture")
    "x" '(scratch-buffer :wk "Open Scratch Buffer")

    ;; Project management
    "p" '(:ignore t :wk "Project Management")
    "p a" '(projectile-add-known-project :wk "Add new project")
    "p r" '(projectile-remove-known-project :wk "Remove known project")
    "p p" '(np/switch-project :wk "Switch current project")
    "p f" '(helm-projectile-find-file :wk "Find file within current")

    ;; Help functions
    "h" '(:ignore t :wk "Help")
    "h v" '(helpful-variable :wk "Describe variable")
    "h k" '(helpful-key :wk "Describe key")
    "h f" '(helpful-function :wk "Describe function")
    "h m" '(describe-mode :wk "Describe mode")
    "h s" '(helpful-symbol :wk "Describe symbol")
    "h p" '(describe-package :wk "Describe package")
    "h h" '(help :wk "General Help")
    "h c" '(helpful-at-point :wk "Describe point")

    ;; Killing, Quitting, and Deleting
    "q" '(:ignore t :wk "Quit")
    "q q" '(evil-save-and-quit :wk "Quit Emacs")

    "d" '(:ignore t :wk "Delete")
    "d b" '(kill-current-buffer :wk "Kill current buffer")
    "d f" '(delete-file :wk "Delete file")

    ;; Window creation, deletion, and navigation
    "w" '(:ignore t :wk "Window")
    "w v" '(evil-window-vsplit :wk "Vertical split")
    "w f" '(evil-window-split :wk "Horizontal split")
    "w w" '(evil-window-next :wk "Switch window")
    "w j" '(evil-window-down :wk "Switch to lower window")
    "w k" '(evil-window-up :wk "Switch to upper window")
    "w l" '(evil-window-right :wk "Switch to right window")
    "w h" '(evil-window-left :wk "Switch to left window")
    "w c" '(evil-window-delete :wk "Close current window")

    ;; Magit & Version Control
    "g" '(:ignore t :wk "Magit")
    "g g" '(magit-status :wk "Git Status")
    "g s" '(magit-stage-file :wk "Git stage/add file")
    "g c" '(magit-commit :wk "Git commit")
    "g p" '(magit-push :wk "Git push")


    ;; Terminals & Interpreters
    "v" 'vterm
    ";" 'ielm

    ;; Org Roam
    "r" '(:ignore t :wk "Org Roam")
    "r b" '(org-roam-buffer-toggle :wk "Show backlinks")
    "r f" '(org-roam-node-find :wk "Open node")
    "r i" '(org-roam-node-insert :wk "Insert or create node")
    "r r" '(org-roam-ref-add :wk "Add reference")
    "r a" '(org-roam-alias-add :wk "Add alias to node")
    "r x" '(org-roam-capture :wk "Org Roam Capture")
    "r d" '(org-roam-dailies-capture-today "Daily Notes")
    ;; 'r f' for "Fleeting Notes"
    "r t" '(org-roam-tag-add :wk "Add tag to node")

    ;; Org
    ;; Agenda and time
    "m" '(:ignore t :wk "All things Org")
    "m a" '(:ignore t :wk "Testing")

    "m a a" '(org-agenda :wk "Agenda")
    "m a d" '(org-deadline :wk "Insert deadline")

    ;; This should be reserved for things like meetings
    "m a t" 'org-time-stamp :wk "Insert active time stamp"

    ;; This should be reserved for the date we want to start working on an item
    "m a s" '(org-schedule :wk "Insert schedule item")

    ;; Inactive time stamps do not impact our agenda view
    "m a i" '(org-time-stamp-inactive :wk "Insert inactive timestamp")

    ;; Table creation and manipulation
    "m t" '(:ignore t :wk "Org Tables")
    "m t c" '(org-table-create :wk "Create New Table")

    ;; Links and tags
    "m l s" 'org-store-link
    "m l l" 'org-insert-link
    "m m p" 'org-mark-ring-push
    "m m g" 'org-mark-ring-goto
    "m q" 'org-set-tags-command

    "o -" 'dired-jump-other-window

    ;; Open things
    "." '(helm-find-files :wk "Open File")
    "," '(switch-to-buffer :wk "Open Existing Project Buffer")

    "TAB n" '(tab-bar-new-tab :wk "New Tab")
    "TAB TAB" '(tab-list :wk "Show Tabs")
    "TAB h" '(tab-bar-switch-to-prev-tab :wk "Previous Tab")
    "TAB l" '(tab-bar-switch-to-next-tab :wk "Next Tab")
    "TAB d" '(close-tab :wk "Close Current Tab")

    "c R" '(eglot-rename :wk "Rename Symbol")
    "c a" '(eglot-code-actions :wk "Execute Action")
    "c q" '(eglot-code-action-quickfix :wk "Quickfix")
    "c i" '(eglot-code-action-inline :wk "Inline")
    "c f" '(eglot-format-buffer :wk "Format Buffer")
    "/" '(comment-dwim :wk "Toggle Comment")
    ))

(provide 'np-general)
;;; np-general.el ends here.
