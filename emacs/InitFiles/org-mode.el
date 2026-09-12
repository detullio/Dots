;; -*- lexical-binding: t; -*-

;; Resolve org-mode directory paths from environment variables exported in
;; ~/.profile after sshfs mounts.
;;
;;   ORG_DIR        ~/Lorelei-DataHuge/OrgFiles   – main org files root
;;   ORG_MOBILE_DIR ~/Lorelei-DataHuge/webdav/Org – MobileOrg sync directory

(setq diary-file
      (expand-file-name "Journal/diary" (getenv "ORG_DIR")))

(setq org-agenda-include-diary t)
(setq-default org-todo-keywords `((sequence "TODO" "ACTIVE" "BLOCKED" "DONE")))

(setq org-mobile-directory
      (file-name-as-directory (getenv "ORG_MOBILE_DIR")))

;; Where captures from the mobile app get written
(setq org-mobile-inbox-for-pull
      (expand-file-name "from-mobile.org" (getenv "ORG_MOBILE_DIR")))

(setq org-directory
      (file-name-as-directory (getenv "ORG_DIR")))

(add-hook 'org-mode-hook (lambda () (setq-local truncate-lines nil)))
(add-hook 'org-agenda-mode-hook (lambda () (setq-local truncate-lines nil)))
(add-hook 'diary-mode-hook (lambda () (setq-local truncate-lines nil)))

(defun my-org-agenda-files ()
  "Return a list of all .org files under ORG_DIR."
  (directory-files-recursively (expand-file-name (getenv "ORG_DIR")) "\\.org\\'"))

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
