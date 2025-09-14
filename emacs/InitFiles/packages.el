;; -*- lexical-binding: t; -*-

;; activate all the packages (in particular autoloads)
(package-initialize)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; Uncomment if package refresh below fails due to signatures and restart
;; after that keyring update should allow it to be re-commented
;;(setq package-check-signature nil)

(if (not package-check-signature)
    (message "Package signature check disabled")
  )

;fetch the list of available packages
(unless package-archive-contents
  (package-refresh-contents))

(dolist (package `(use-package))
  (unless (package-installed-p package)
    (package-install package)))

;; list the packages you want
(setq package-list `(
                     all-the-icons-ibuffer
                     apache-mode
                     bar-cursor
                     bm
                     boxquote
                     browse-kill-ring
                     cmake-mode
                     cmake-project
                     csv-mode
                     diminish
                     dired-filetype-face
                     diredc
                     dirtree
                     dirvish
                     ede-compdb
                     eglot
                     eproject
                     fill-column-indicator
                     flycheck-google-cpplint
                     folding
                     gnu-elpa-keyring-update
                     google-c-style
                     graphviz-dot-mode
                     gtags-mode
                     helm-ls-git
                     htmlize
                     ibuffer-git
                     ibuffer-project
                     ibuffer-tramp
                     ibuffer-vc
                     initsplit
                     lua-mode
                     magit
                     markdown-preview-mode
                     org-modern
                     python-mode
                     resize-window
                     session
                     tabbar
                     visual-fill-column
                     yaml
                     yaml-imenu
                     yasnippet
                     ztree
                     ))

;; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
