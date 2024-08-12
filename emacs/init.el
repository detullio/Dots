;;Turn on debug for load of init.el
(setq debug-on-error t)

(require 'package)
(package-initialize)

;; Uncomment if package refresh below fails due to signatures and restart,
;; after that keyring update should allow it to be recommented
;;(setq package-check-signature nil)

(setq package-archives
      '(("melpa" . "http://melpa.org/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
(package-refresh-contents)

; Do without annoying startup msg.
(setq inhibit-startup-message t)

;; use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; don't show the silly stuff at the top, I know I'm using emacs
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)

(transient-mark-mode 0)

(setq cursor-type 'box)

(setq cursor-type '"%R%U %s %a %o")

;;enable some old skool behavior
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq split-width-threshold nil)
(setq-default truncate-lines t)
(setq global-font-lock-mode t)

;; theme me
(load-theme 'KDeT t)
(set-face-attribute 'default nil :font "-GOOG-Noto Sans Mono-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1")
(set-frame-font "-GOOG-Noto Sans Mono-normal-normal-normal-*-12-*-*-*-*-0-iso10646-1" nil t)

(defconst font-lock-maximum-decoration t)
(setq visible-bell 1)

(setq column-number-mode t)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

;;Dired
(setq dired-listing-switches "-hlX")
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq-default dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..?")

(setq-default develock-max-column-plist (quote
                                         (emacs-lisp-mode w lisp-interaction-mode w change-log-mode w texinfo-mode
                                                          w c-mode w c++-mode w java-mode w jde-mode w html-mode
                                                          w html-helper-mode w cperl-mode w perl-mode w mail-mode
                                                          t message-mode t cmail-mail-mode t tcl-mode 79 ruby-mode 79)))

;;reuse frame if buffer open
(setq-default display-buffer-reuse-frames t)

;;setup tramp for sudo
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))

(eval-after-load "tramp"
  '(progn
     (defvar sudo-tramp-prefix
       "/sudo:" 
       (concat "Prefix to be used by sudo commands when building tramp path "))
     (defun sudo-file-name (filename)
       (set 'splitname (split-string filename ":"))
       (if (> (length splitname) 1)
         (progn (set 'final-split (cdr splitname))
                (set 'sudo-tramp-prefix "/sudo:")
                )
         (progn (set 'final-split splitname)
                (set 'sudo-tramp-prefix (concat sudo-tramp-prefix "root@localhost:")))
         )
       (set 'final-fn (concat sudo-tramp-prefix (mapconcat (lambda (e) e) final-split ":")))
       (message "splitname is %s" splitname)
       (message "sudo-tramp-prefix is %s" sudo-tramp-prefix)
       (message "final-split is %s" final-split)
       (message "final-fn is %s" final-fn)
       (message "%s" final-fn)
       )

     (defun sudo-find-file (filename &optional wildcards)
       "Calls find-file with filename with sudo-tramp-prefix prepended"
       (interactive "fFind file with sudo ")      
       (let ((sudo-name (sudo-file-name filename)))
         (apply 'find-file 
                (cons sudo-name (if (boundp 'wildcards) '(wildcards))))))

     (defun sudo-reopen-file ()
       "Reopen file as root by prefixing its name with sudo-tramp-prefix and by clearing buffer-read-only"
       (interactive)
       (let* 
           ((file-name (expand-file-name buffer-file-name))
            (sudo-name (sudo-file-name file-name)))
         (progn           
           (setq buffer-file-name sudo-name)
           (rename-buffer sudo-name)
           (setq buffer-read-only nil)
           (message (concat "File name set to " sudo-name)))))

     (global-set-key [(control x)(control shift f)] 'sudo-find-file)
     (global-set-key [(control x)(control r)] 'sudo-reopen-file)))

(require 'tramp)

;;M-k kills to the left
(global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) )

;;Org-mode
(setq-default org-agenda-files (quote ("~/OrgFiles/Projects/ProScuzNetwork.org" "~/OrgFiles/RandomResearch.org" "~/OrgFiles/todo.org")))

(setq-default org-todo-keywords `((sequence "TODO" "ACTIVE" "BLOCKED" "DONE")))

(add-to-list 'load-path "~/.emacs.d/InitFiles/")

(load "compilation")
(load "c_c++")
(load "fortran")
(load "csv")
(load "beamer")
(load "gdb")
(load "lua")
(load "packages")
(load "python")

;; ansi color??
(when (require 'ansi-color nil t)
(defun my-colorize-compilation-buffer ()
    (when (eq major-mode 'compilation-mode)
      (ansi-color-apply-on-region compilation-filter-start (point-max))))

(add-hook 'compilation-filter-hook 'my-colorize-compilation-buffer))

(setq directory-abbrev-alist '(("^/mnt/host/" . "./")))

(defalias 'SourceClean (read-kbd-macro
                        "<C-home> C-SPC <C-end> M-x untabify TAB RET <C-home> M-x repl TAB rege TAB RET 2*SPC * RET SPC RET <C-home> C-SPC <C-end> M-x inden TAB - reg TAB RET"))

;; pulled from comp.emacs discussion
;; http://groups.google.com/group/comp.emacs/browse_thread/thread/6fcb3d62d7a501af/c6590cf7ab1f1876?show_docid=c6590cf7ab1f1876#
(defface find-file-root-header-face
  '((t (:foreground "white" :background "red3")))
  "*Face use to display header-lines for files opened as root.")

(defun find-file-root-header-warning ()
  "*Display a warning in header line of the current buffer.
This function is suitable to add to `find-file-hook'."
  (when (string-equal
         (file-remote-p (or buffer-file-name default-directory) 'user)
         "root")
    (let* ((warning "WARNING: EDITING FILE AS ROOT!")
           (space (+ 6 (- (window-width) (length warning))))
           (bracket (make-string (/ space 2) ?-))
           (warning (concat bracket warning bracket)))
      (setq header-line-format
            (propertize  warning 'face 'find-file-root-header-face)))))

(defun find-alternative-file-with-sudo ()
  (interactive)
  (let ((bname (expand-file-name (or buffer-file-name
                                     default-directory)))
        (pt (point)))
    (setq bname (or (file-remote-p bname 'localname)
                    (concat "/sudo::" bname)))
    ;; FIXME mostly works around, but not quite
    (flet ((server-buffer-done
            (buffer &optional for-killing)
            nil))
      (find-alternate-file bname))
    (goto-char pt)))

;; normally this is bound to find-file-read-only
;; use M-x toggle-read-only instead
(global-set-key (kbd "C-x C-r") 'find-alternative-file-with-sudo)

(add-hook 'find-file-hook 'find-file-root-header-warning)
(add-hook 'dired-mode-hook 'find-file-root-header-warning)

(autoload 'word-count-mode "word-count"
  "Minor mode to count words." t nil)
(global-set-key "\M-+" 'word-count-mode)

;; Automatically uncompress .gz files
(auto-compression-mode)

(setq backup-directory-alist `(("." . "~/.emacsBak")))
(setq backup-by-copying-when-linked t)

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(setq completion-ignored-extensions
      '(".obj" ".xpt" ".a" ".so" ".o" ".d" ".elc" ".class" "~" ".ckp" ".bak" ".imp" ".lpt" ".bin" ".otl" ".err" ".lib" ".x9700" ".aux" ))

(desktop-save-mode 1)
(setq desktop-path '("."))

;;long lines during commit messages
(add-to-list 'auto-mode-alist '("/bzr_log\\." . longlines-mode))

;;load dvc stuff
;; (require 'dvc-autoloads)

(setq debug-on-error nil)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(markdown-preview-mode yasnippet lua-mode fill-column-indicator ibuffer-vc ibuffer-tramp ibuffer-git all-the-icons-ibuffer gnu-elpa-keyring-update eglot python-mode resize-window windresize google-c-style flycheck-google-cpplint cmake-mode yaml-imenu yaml tabbar session pod-mode muttrc-mode mutt-alias markdown-mode initsplit htmlize graphviz-dot-mode folding eproject diminish csv-mode browse-kill-ring boxquote bm bar-cursor apache-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
