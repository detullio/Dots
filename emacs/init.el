
;;Turn on debug for load of init.el
(setq debug-on-error t)
(setq stack-trace-on-error)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

; Do without annoying startup msg.
(setq inhibit-startup-message t)

;; use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; don't show the silly stuff at the top, I know I'm using emacs
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)

(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t) ; Org-mode's repository
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

(setq cursor-type 'box)

(transient-mark-mode 0)

(setq cursor-type '"%R%U %s %a %o")

;;enable some old skool behavior
(put 'scroll-left 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(setq split-width-threshold nil)
(setq truncate-lines 1)
(setq global-font-lock-mode t)

;;Org-mode
(setq org-agenda-files "~/.emacs.d/OrgAgendaFiles")

(require 'org-table)

(quote ("~/Documents/OrgFiles/Projects/ProScuzNetwork.org" "~/Documents/OrgFiles/RandomResearch.org" "~/Documents/OrgFiles/todo.org")))

(defconst font-lock-maximum-decoration t)
(setq visible-bell 1)
;; C-Mode stuff
(setq-default c-default-style (quote ((c-mode . "stroustrup") (c++-mode . "stroustrup") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
(setq c-echo-syntactic-information-p t)
(setq c-label-minimum-indentation 2)
(setq c-mode-hook nil)
(setq c-report-syntactic-errors t)
(setq-default c-basic-offset 2)
(setq-default indent-tabs-mode nil)
(setq-default custom-buffer-indent 2)
(setq-default standard-indent 2)

;;camelcase mode
(autoload 'camelCase-mode "camelCase-mode" t)

(setq column-number-mode t)

(setq fortran-blink-matching-if t)
(setq fortran-check-all-num-for-matching-do t)
(setq fortran-comment-indent-style nil)
(setq fortran-comment-line-start "!")
(setq fortran-line-length 128)

;; Always end a file with a newline
(setq require-final-newline t)

;; Stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)

(setq dired-listing-switches "-hlX")
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..?")

(setq develock-max-column-plist (quote
                                 (emacs-lisp-mode w lisp-interaction-mode w change-log-mode w texinfo-mode
                                                  w c-mode w c++-mode w java-mode w jde-mode w html-mode
                                                  w html-helper-mode w cperl-mode w perl-mode w mail-mode
                                                  t message-mode t cmail-mail-mode t tcl-mode 79 ruby-mode 79)))


(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;enable ctags for some languages:
;; Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(semantic-load-enable-primary-exuberent-ctags-support)

;;Enabling Semantic (code-parsing, smart completion) features
Select one of the following:

;;* This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;;* This enables some tools useful for coding, such as summary mode
;;  imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;;* This enables even more coding tools such as intellisense mode
;;  decoration mode, and stickyfunc mode (plus regular code helpers)
(semantic-load-enable-gaudy-code-helpers)

;;* This enables the use of Exuberent ctags if you have it installed.
;;  If you use C++ templates or boost, you should NOT enable it.
(semantic-load-enable-all-exuberent-ctags-support)
;;  Or, use one of these two types of support.
;;  Add support for new languges only via ctags.
(semantic-load-enable-primary-exuberent-ctags-support)
;;  Add support for using ctags as a backup parser.
(semantic-load-enable-secondary-exuberent-ctags-support)

;;Enable SRecode (Template management) minor-mode.
(global-srecode-minor-mode 1)

;;Wrap compilation windows
(defun my-compilation-mode-hook ()
  (setq truncate-lines nil)
  (setq truncate-partial-width-windows nil))
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

;;other compilation stuff
(setq comint-scroll-to-bottom-on-input (quote this))
(setq compilation-auto-jump-to-first-error nil)
(setq compilation-context-lines 9)
(setq compilation-scroll-output (quote first-error))
(setq compilation-skip-threshold 2)
(setq compilation-skip-visited t)
(setq compilation-window-height 20)
(setq compile-command "scons ")

;;reuse frame if buffer open
(setq-default display-buffer-reuse-frames t)

(setq my_c-mode-common-hook (quote ((lambda nil (camelCase-mode 1)) (lambda nil (hs-minor-mode 1)))))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

(setq my_python-mode-common-hook (quote ((lambda nil (camelCase-mode 1)) (lambda nil (hs-minor-mode 1)))))
(add-hook 'python-mode-common-hook 'my-python-mode-common-hook)

;;SCons file font-lock
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))

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
;;debugging
(setq gdb-many-windows nil)
(setq gdb-same-frame nil)
(setq gdb-show-main t)
(setq gdb-use-colon-colon-notation t)
(setq gdb-use-separate-io-buffer t)

;; ses-csv.el -- Read/Write CSV file for SES
;; Author: Takashi Hattori (hattori@sfc.keio.ac.jp)
;; Requires: Ruby

(defun ses-read-from-csv-file (file)
  "Insert the contents of a CSV file named FILE into the current position."
  (interactive "fCSV file: ")
  (let ((buf (get-buffer-create "*ses-csv*"))
	text)
    (save-excursion
      (set-buffer buf)
      (erase-buffer)
      (process-file "ruby" file buf nil "-e" "require 'csv'; CSV::Reader.parse(STDIN) { |x| puts x.join(\"\\t\") }")
      (setq text (buffer-substring (point-min) (point-max))))
    (ses-yank-tsf text nil)))

(defun ses-write-to-csv-file (file)
  "Write the values of the current buffer into a CSV file named FILE."
  (interactive "FCSV file: ")
  (push-mark (point-min) t t)
  (goto-char (- (point-max) 1))
  (ses-set-curcell)
  (ses-write-to-csv-file-region file))

(defun ses-write-to-csv-file-region (file)
  "Write the values of the region into a CSV file named FILE."
  (interactive "FCSV file: ")
  (ses-export-tab nil)
  (let ((buf (get-buffer-create "*ses-csv*")))
    (save-excursion
      (set-buffer buf)
      (erase-buffer)
      (yank)
      (call-process-region (point-min) (point-max) "ruby" t buf nil "-e" "require 'csv'; w = CSV::Writer.create(STDOUT); STDIN.each { |x| w << x.chomp.split(/\\t/) }")
      (write-region (point-min) (point-max) file))))

;; (custom-set-variables
;;   ;; custom-set-variables was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(ac-sources (quote (ac-source-yasnippet ac-source-imenu ac-source-abbrev ac-source-words-in-buffer ac-source-files-in-current-dir ac-source-filename)) t)
;;  '(blink-cursor-mode 5)
;;  '(c++-mode-hook nil)
;;  '(c-basic-offset 2)
;;  '(c-default-style (quote ((c-mode . "stroustrup") (c++-mode . "stroustrup") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
;;  '(c-max-one-liner-length 512)
;;  '(c-mode-common-hook (quote ((lambda nil (camelCase-mode 1)) (lambda nil (local-set-key [tab] (quote indent-or-complete))) (lambda nil (hs-minor-mode 1)))))
;;  '(develock-auto-enable nil)
;;  '(develock-inhibit-highlighting-kinsoku-chars nil)
;;  '(develock-max-column-plist (quote (emacs-lisp-mode nil lisp-interaction-mode nil change-log-mode t texinfo-mode t c-mode w c++-mode nil java-mode nil jde-mode nil html-mode nil html-helper-mode nil cperl-mode nil perl-mode nil mail-mode nil message-mode nil cmail-mail-mode nil tcl-mode nil ruby-mode nil)))
;;  '(dired-listing-switches "-FlhXsZA")
;;  '(fortran-blink-matching-if t)
;;  '(fortran-check-all-num-for-matching-do t)
;;  '(fortran-comment-indent-style nil)
;;  '(fortran-comment-line-start "!")
;;  '(fortran-line-length 128)
;;  '(gdb-many-windows t)
;;  '(gdb-same-frame nil)
;;  '(gdb-show-main t)
;;  '(gdb-use-colon-colon-notation t)
;;  '(gdb-use-separate-io-buffer t)
;;  '(indent-tabs-mode nil)
;;  '(indicate-empty-lines t)
;;  '(list-directory-verbose-switches "-AlFhX")
;;  '(require-final-newline t)
;;  '(show-trailing-whitespace t)
;;  '(size-indication-mode t)
;;  '(spell-command "aspell")
;;  '(split-width-threshold 500)
;;  '(standard-indent 2)
;;  '(tags-revert-without-query t)
;;  '(transient-mark-mode nil)
;;  '(truncate-lines t)
;;  '(use-file-dialog nil))

;; (require 'session)
;; (add-hook 'after-init-hook 'session-initialize)

;; (add-hook 'text-mode-hook
;;           '(lambda () (auto-fill-mode 0)))

;; (setq default-major-mode 'text-mode)

;; ;; (require `apropos+)

;; ;; ;; full-ack stuff
;; ;; (require `full-ack)
;; ;; (setq ack-executable (executable-find "ack-grep"))

;; ;; (autoload 'ack-same "full-ack" nil t)
;; ;; (autoload 'ack "full-ack" nil t)
;; ;; (autoload 'ack-find-same-file "full-ack" nil t)
;; ;; (autoload 'ack-find-file "full-ack" nil t)

;; (setq ring-bell-function
;;       (lambda ()
;;         (unless (memq this-command
;;                       '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
;;           (ding))))

(global-set-key [(control shift b)] 'recompile)
(global-set-key [(control shift x)] 'desktop-clear)
(global-set-key [(control x)(meta x)] 'tags-search)
(global-set-key [(control c) (control c)] 'comment-region)
(global-set-key [(control c) (control u)] 'uncomment-region)

(global-set-key "\C-z" 'undo)

;;M-k kills to the left
(global-set-key "\M-k" '(lambda () (interactive) (kill-line 0)) )

;; (defalias 'SourceClean (read-kbd-macro

;; "<C-home> C-SPC <C-end> M-x untabify TAB RET <C-home> M-x repl TAB rege TAB RET 2*SPC * RET SPC RET <C-home> C-SPC <C-end> M-x inden TAB - reg TAB RET"))

;; (fset 'FortranDimension
;;    [?\C-e ?\C-  ?\C-r ?\( right left ?\C-k ?\C-r ?\) right left right ?, ?d ?i ?m ?e ?n ?s ?i ?o ?n ?\C-y])


;; (fset 'CleanFort
;;    [?\M-x ?r ?e ?p ?l ?a ?c ?e ?- ?r ?e ?g tab return ?^ ?C return ?! return C-home ?\M-x up return ?^ ?! ?  ?* ?$ return return C-home ?\C-  C-end ?\M-x ?d ?o ?w ?n ?c ?a ?s ?e ?- ?r ?e ?g ?i ?o ?n return])

;; (fset 'JoinLines
;;    [?\M-x ?s ?e ?a ?r ?c ?h tab ?f ?o ?r ?w ?a ?r tab ?- ?r ?e ?g tab return ?^ ?  ?  ?  ?  ?  ?[ ?^ ?[ ?: ?s ?p ?a ?c ?e ?: ?] ?} backspace ?] ?  ?+ return ?\M-x ?f ?o ?r ?t ?r ?a ?n tab ?j ?o ?i tab return])

;; (fset 'LogicalBreak
;;    [?\C-s ?, right left backspace return tab ?l ?o ?g ?i ?c ?a ?l ? ?: ?: ? ])

;; (fset 'RealBreak
;;    [?\C-s ?, right left backspace return tab ?r ?e ?a ?l ?  ?: ?: ? ])

;; (fset 'IntegerBreak
;;    [?\C-s ?, right left backspace return tab ?i ?n ?t ?e ?g ?e ?r ?  ?: ?: ? ])
;; (fset 'DoClean
;;    [?\M-x ?s ?e ?a ?r tab ?f ?o ?r ?w tab ?- ?r ?e ?g tab return ?\\ ?W ?d ?o ?\\ ?W ?[ ?0 ?- ?9 ?] ?+ return ?\C-  C-left ?\C-w backspace ?\C-s ?c ?o ?n ?t ?i ?n ?u ?e ?\C-a ?\C-k ?e ?n ?d ?  ?d ?o ?\C-a tab down])

;; ;; pulled from comp.emacs discussion
;; ;; http://groups.google.com/group/comp.emacs/browse_thread/thread/6fcb3d62d7a501af/c6590cf7ab1f1876?show_docid=c6590cf7ab1f1876#
;; (defface find-file-root-header-face
;;   '((t (:foreground "white" :background "red3")))
;;   "*Face use to display header-lines for files opened as root.")

;; (defun find-file-root-header-warning ()
;;   "*Display a warning in header line of the current buffer.
;; This function is suitable to add to `find-file-hook'."
;;   (when (string-equal
;;          (file-remote-p (or buffer-file-name default-directory) 'user)
;;          "root")
;;     (let* ((warning "WARNING: EDITING FILE AS ROOT!")
;;            (space (+ 6 (- (window-width) (length warning))))
;;            (bracket (make-string (/ space 2) ?-))
;;            (warning (concat bracket warning bracket)))
;;       (setq header-line-format
;;             (propertize  warning 'face 'find-file-root-header-face)))))

;; (defun find-alternative-file-with-sudo ()
;;   (interactive)
;;   (let ((bname (expand-file-name (or buffer-file-name
;;                                      default-directory)))
;;         (pt (point)))
;;     (setq bname (or (file-remote-p bname 'localname)
;;                     (concat "/sudo::" bname)))
;;     ;; FIXME mostly works around, but not quite
;;     (flet ((server-buffer-done
;;             (buffer &optional for-killing)
;;             nil))
;;       (find-alternate-file bname))
;;     (goto-char pt)))

;; ;; normally this is bound to find-file-read-only
;; ;; use M-x toggle-read-only instead
;; (global-set-key (kbd "C-x C-r") 'find-alternative-file-with-sudo)

;; (add-hook 'find-file-hook 'find-file-root-header-warning)
;; (add-hook 'dired-mode-hook 'find-file-root-header-warning)

;; (setq load-path (cons (expand-file-name "~/elisp") load-path))

;; (autoload 'word-count-mode "word-count"
;;   "Minor mode to count words." t nil)
;; (global-set-key "\M-+" 'word-count-mode)

;; ;; Automatically uncompress .gz files
;; (auto-compression-mode)

;; setup backup and autosave
(setq version-control t)
(setq delete-auto-save-files t)

(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; create a backup file directory
(defun make-backup-file-name (file)
  (concat "~/.emacs.d/backups/" (file-name-nondirectory file) "~"))

(defun auto-save-file-name-p (filename)
  "Return non-nil if FILENAME can be yielded by..."
  (string-match "~\/\.emacs\.d\/autosave\/#.*#$" filename))

(defun make-auto-save-file-name ()
  "Return file name to use for auto-saves \
of current buffer@enddots{}"
  (if buffer-file-name
      (concat
       "~/.emacs.d/autosave/" "#"
       (file-name-nondirectory buffer-file-name)
       "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#"))))

;; (setq completion-ignored-extensions
;;       '(".obj" ".xpt" ".a" ".so" ".o" ".d" ".elc" ".class" "~" ".ckp" ".bak" ".imp" ".lpt" ".bin" ".otl" ".err" ".lib" ".x9700" ".aux" ))

;; ;;long lines during commit messages
;; (add-to-list 'auto-mode-alist '("/bzr_log\\." . longlines-mode))

;; ;;load dvc stuff
;; ;; (require 'dvc-autoloads)

;; ;; allow for export=>beamer by placing

;; ;; #+LaTeX_CLASS: beamer in org files
;; (unless (boundp 'org-export-latex-classes)
;;   (setq org-export-latex-classes nil))
;; (add-to-list 'org-export-latex-classes
;;   ;; beamer class, for presentations
;;   '("beamer"
;;      "\\documentclass[11pt]{beamer}\n
;;       \\mode<{{{beamermode}}}>\n
;;       \\usetheme{{{{beamertheme}}}}\n
;;       \\usecolortheme{{{{beamercolortheme}}}}\n
;;       \\beamertemplateballitem\n
;;       \\setbeameroption{show notes}
;;       \\usepackage[utf8]{inputenc}\n
;;       \\usepackage[T1]{fontenc}\n
;;       \\usepackage{hyperref}\n
;;       \\usepackage{color}
;;       \\usepackage{listings}
;;       \\lstset{numbers=none,language=[ISO]C++,tabsize=4,
;;   frame=single,
;;   basicstyle=\\small,
;;   showspaces=false,showstringspaces=false,
;;   showtabs=false,
;;   keywordstyle=\\color{blue}\\bfseries,
;;   commentstyle=\\color{red},
;;   }\n
;;       \\usepackage{verbatim}\n
;;       \\institute{{{{beamerinstitute}}}}\n
;;        \\subject{{{{beamersubject}}}}\n"

;;      ("\\section{%s}" . "\\section*{%s}")

;;      ("\\begin{frame}[fragile]\\frametitle{%s}"
;;        "\\end{frame}"
;;        "\\begin{frame}[fragile]\\frametitle{%s}"
;;        "\\end{frame}")))

;;   ;; letter class, for formal letters

;;   (add-to-list 'org-export-latex-classes

;;   '("letter"
;;      "\\documentclass[11pt]{letter}\n
;;       \\usepackage[utf8]{inputenc}\n
;;       \\usepackage[T1]f{ontenc}\n
;;       \\usepackage{color}"

;;      ("\\section{%s}" . "\\section*{%s}")
;;      ("\\subsection{%s}" . "\\subsection*{%s}")
;;      ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
;;      ("\\paragraph{%s}" . "\\paragraph*{%s}")
;;      ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

(setq debug-on-error nil)
(setq stack-trace-on-error nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("dd2346baba899fa7eee2bba4936cfcdf30ca55cdc2df0a1a4c9808320c4d4b22" "9a3c51c59edfefd53e5de64c9da248c24b628d4e78cc808611abd15b3e58858f" "abd7719fd9255fcd64f631664390e2eb89768a290ee082a9f0520c5f12a660a8" "ab04c00a7e48ad784b52f34aa6bfa1e80d0c3fcacc50e1189af3651013eb0d58" "a0feb1322de9e26a4d209d1cfa236deaf64662bb604fa513cca6a057ddf0ef64" "04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
