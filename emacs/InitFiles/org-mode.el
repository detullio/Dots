;; -*- lexical-binding: t; -*-

(setq diary-file "~/working/documenting/OrgFiles/Journal/diary")
(setq org-agenda-include-diary t)
(setq-default org-todo-keywords `((sequence "TODO" "ACTIVE" "BLOCKED" "DONE")))

(setq org-mobile-directory "~/Lorelei-DataHuge/webdav/Org/")

;; Where captures from the mobile app get written
(setq org-mobile-inbox-for-pull "~/working/documenting/OrgFiles/from-mobile.org")

(setq org-directory "~/Lorelei-DataHuge/webdav/OrgFiles/")

(add-hook 'org-mode-hook (lambda () (setq-local truncate-lines nil)))
(add-hook 'org-agenda-mode-hook (lambda () (setq-local truncate-lines nil)))
(add-hook 'diary-mode-hook (lambda () (setq-local truncate-lines nil)))

(defun my-org-agenda-files ()
  "Return a list of all .org files under `~/working/documenting/OrgFiles/'."
  (directory-files-recursively
   (expand-file-name "~/working/documenting/OrgFiles/")
   "\\.org\\'"))

(setq-default org-agenda-files (my-org-agenda-files))

(setq
 ;; Edit settings
 org-auto-align-tags nil
 org-tags-column 0
 org-catch-invisible-edits 'show-and-error
 org-special-ctrl-a/e t
 org-insert-heading-respect-content t

 ;; Org styling, hide markup etc.
 org-hide-emphasis-markers t
 org-pretty-entities t
 org-agenda-tags-column 0
 org-ellipsis "…")

(add-hook 'org-mode-hook #'org-modern-mode)
(add-hook 'org-agenda-finalize-hook #'org-modern-agenda)
