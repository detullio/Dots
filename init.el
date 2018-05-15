;;Turn on debug for load of init.el
(setq debug-on-error t)
(setq stack-trace-on-error)

;; (set-face-attribute `latex-mode-default nil :height 250 :font "-apple-Adobe_Garamond_Pro-medium-normal-normal-*-*-*-*-*-p-0-iso10646-1")
;; (set-face-attribute `text-mode-default nil :height 250 :font "-apple-Adobe_Garamond_Pro-medium-normal-normal-*-*-*-*-*-p-0-iso10646-1")
;; (set-face-attribute `org-mode-default nil :height 250 :font "-apple-Adobe_Garamond_Pro-medium-normal-normal-*-*-*-*-*-p-0-iso10646-1")
;; (set-face-attribute `mode-line nil :height 200 :font "-apple-Gill_Sans-medium-normal-normal-*-*-*-*-*-p-0-iso10646-1")
;; (set-face-attribute 'default nil :height 250 :font "-apple-Letter_Gothic_Std-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")

(setq cursor-type 'box)

(setq cursor-type '"%R%U %s %a %o")

(add-to-list 'load-path "~/.emacs.d/elisp")
(add-to-list 'load-path "~/.emacs.d/elisp/popup-el")
(add-to-list 'load-path "~/.emacs.d/elisp/auto-complete")
(add-to-list 'load-path "~/.emacs.d/elisp/lua-mode")

(require `pgg)

;; Autocomplete stuff
;;(require 'auto-complete-config.el)
;;(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

;; (require 'yasnippet-bundle)
;; (require 'auto-complete-clang)

;; (require 'auto-complete+)
;; (require 'auto-complete-extension)

;; (defun my-ac-config ()
;;   (setq ac-clang-flags (split-string "-I/usr/include/c++/4.5 -I/usr/include/boost"))
;;   (setq-default ac-sources '(ac-source-abbrev ac-source-dictionary ac-source-words-in-same-mode-buffers))
;;   (add-hook 'emacs-lisp-mode-hook 'ac-emacs-lisp-mode-setup)
;;   (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
;;   (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
;;   (add-hook 'css-mode-hook 'ac-css-mode-setup)
;;   (add-hook 'auto-complete-mode-hook 'ac-common-setup)
;;   (global-auto-complete-mode t))

;; (defun kenny-ac-cc-mode-setup ()
;;   (setq ac-sources (append '(ac-source-clang ac-source-yasnippet) ac-sources)))
 
;; (add-hook 'c-mode-common-hook 'kenny-ac-cc-mode-setup)

;; (my-ac-config)

;; (setq ac-auto-start t)
;; (setq ac-quick-help-delay 0.5)
;; (setq ac-delay 0.5)
;; (define-key ac-completing-map [(control .)] 'ac-stop)

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
;; (set-face-attribute `org-mode-default nil :height 250 :font "-apple-Arial-medium-normal-normal-*-*-*-*-*-p-0-iso10646-1")
;; (set-face-attribute `org-table nil :height 250 :font "-apple-Letter_Gothic_Std-medium-normal-normal-*-*-*-*-*-m-0-iso10646-1")

;;(quote ("~/Documents/OrgFiles/Projects/ProScuzNetwork.org" "~/Documents/OrgFiles/RandomResearch.org" "~/Documents/OrgFiles/todo.org")))

(defconst font-lock-maximum-decoration t)
(setq visible-bell 1)

(setq-default sr-speedbar-right-side nil)

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

;; use y or n instead of yes or no
(fset 'yes-or-no-p 'y-or-n-p)

;; don't show the silly stuff at the top, I know I'm using emacs
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode -1)

; Do without annoying startup msg.
(setq inhibit-startup-message t)

;;dired plus stuff
(require 'dired+)
(require 'dired-sort-menu+)

(setq dired-listing-switches "-hlXAZ")
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..?")

(setq develock-max-column-plist (quote
                                 (emacs-lisp-mode w lisp-interaction-mode w change-log-mode w texinfo-mode
                                                  w c-mode w c++-mode w java-mode w jde-mode w html-mode
                                                  w html-helper-mode w cperl-mode w perl-mode w mail-mode
                                                  t message-mode t cmail-mail-mode t tcl-mode 79 ruby-mode 79)))
;;emacs midnight commander mode
(require 'mc)

;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.

;;(load-file "~/.emacs.d/elisp/cedet-bzr/common/cedet.el")


;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")

;;(require 'ede-generic)
;;(require `semantic-gcc)

;; if you want to enable support for gnu global
;;(require 'semanticdb-global)
;; (semanticdb-enable-gnu-global-databases 'c-mode)
;; (semanticdb-enable-gnu-global-databases 'c++-mode)
;; (setq semantic-ectag-program 'ctags)

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;; (semantic-load-enable-primary-exuberent-ctags-support)

;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
;; (semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
;; (semantic-load-enable-code-helpers)

;; * This enables even more coding tools such as intellisense mode
;;   decoration mode, and stickyfunc mode (plus regular code helpers)
;; (semantic-load-enable-gaudy-code-helpers)

;; * This enables the use of Exuberent ctags if you have it installed.
;;   If you use C++ templates or boost, you should NOT enable it.
;; (semantic-load-enable-all-exuberent-ctags-support)
;;   Or, use one of these two types of support.
;;   Add support for new languges only via ctags.
;; (semantic-load-enable-primary-exuberent-ctags-support)
;;   Add support for using ctags as a backup parser.
;; (semantic-load-enable-secondary-exuberent-ctags-support)

;; Enable SRecode (Template management) minor-mode.
;; (global-srecode-minor-mode 1)

;;Wrap compilation windows
;; (defun my-compilation-mode-hook ()
;;   (setq truncate-lines nil)
;;   (setq truncate-partial-width-windows nil))
;; (add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

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

;; Color theme
(eval-when-compile    (require 'color-theme))
(defun my-color-theme ()
  "Color theme by Kenneth M. DeTullio, created 2010-11-26."
  (interactive)
  (color-theme-install
   '(my-color-theme
     ((background-color . "dark slate grey")
      (background-mode . dark)
      (border-color . "black")
      (cursor-color . "black")
      (foreground-color . "black")
      (mouse-color . "black"))
     ((ac-fuzzy-cursor-color . "red")
      (list-matching-lines-buffer-name-face . underline)
      (list-matching-lines-face . match)
      (term-default-bg-color . "dark slate grey")
      (term-default-fg-color . "black")
      (view-highlight-face . highlight)
      (widget-mouse-face . highlight))
     (default ((t (:stipple nil :background "dark slate grey" :foreground "black" :inverse-video nil
                   :box nil :strike-through nil :overline nil :underline nil :slant normal
                   :weight normal :height 118 :width normal :foundry "urw" :family "Nimbus Mono L"))))
     (ac-candidate-face ((t (:background "lightgray" :foreground "black"))))
     (ac-completion-face ((t (:foreground "darkgray" :underline t))))
     (ac-gtags-candidate-face ((t (:background "lightgray" :foreground "navy"))))
     (ac-gtags-selection-face ((t (:background "navy" :foreground "white"))))
     (ac-selection-face ((t (:background "steelblue" :foreground "white"))))
     (ac-yasnippet-candidate-face ((t (:background "sandybrown" :foreground "black"))))
     (ac-yasnippet-selection-face ((t (:background "coral3" :foreground "white"))))
     (org-hide ((((background dark)) (:foreground "darkslategray"))))
     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (border ((t (nil))))
     (buffer-menu-buffer ((t (:bold t :weight bold))))
     (button ((t (:underline t))))
     (completions-common-part ((t (:family "Nimbus Mono L" :foundry "urw" :width normal :weight normal
                                           :slant normal :underline nil :overline nil :strike-through nil
                                           :box nil :inverse-video nil :foreground "black"
                                           :background "dark slate grey" :stipple nil :height 118))))
     (completions-first-difference ((t (:bold t :weight bold))))
     (cursor ((t (nil))))
     (dired-directory ((t (:bold t :weight bold :foreground "OliveDrab"))))
     (dired-flagged ((t (:foreground "yellow" :background "red"))))
     (dired-header ((t (:foreground "#9290ff"))))
     (dired-ignored ((t (:foreground "grey70"))))
     (dired-mark ((t (:bold t :weight bold :foreground "white"))))
     (dired-marked ((t (:foreground "yellow" :background "red"))))
     (dired-perm-write ((t (:foreground "white"))))
     (dired-symlink ((t (:foreground "DarkOliveGreen3"))))
     (dired-warning ((t (:foreground "yellow" :background "red"))))
     (diredp-date-time ((((background dark)) (:foreground "black"))))                      
     (diredp-deletion-file-name ((t (:foreground "Red" :strike-through t))))               
     (diredp-dir-heading ((((background dark)) (:foreground "black" :weight extra-bold)))) 
     (diredp-exec-priv ((((background dark)) (:background "gray30"))))                     
     (diredp-number ((((background dark)) (:foreground "black"))))                         
     (diredp-read-priv ((((background dark)) (:background "slategray"))))                  
     (diredp-dir-priv ((((background dark)) (:weight bold :foreground "black"))))
     (diredp-write-priv ((((background dark)) (:background "darkslategray"))))
     (diredp-file-name ((((background dark)) (:foreground "black"))))
     (diredp-file-suffix ((((background dark)) (:foreground "gray10"))))
     (diredp-ignored-file-name ((((background dark)) (:foreground "gray15"))))
     (ediff-current-diff-A ((((class color) (min-colors 16)) (:foreground "black" :background "lightslategray"))))
     (ediff-current-diff-B ((((class color) (min-colors 16)) (:foreground "black" :background "lightslategray"))))
     (smerge-refined-change ((t (:slant italic))))
     (eieio-custom-slot-tag-face ((t (:foreground "light blue"))))
     (eldoc-highlight-function-argument ((t (:bold t :weight bold))))
     (escape-glyph ((t (:foreground "gray10"))))
     (file-name-shadow ((t (:foreground "grey70"))))
     (find-file-root-header-face ((t (:background "red3" :foreground "white"))))
     (fixed-pitch ((t (:family "Monospace"))))
     (font-lock-builtin-face ((t (:bold t :weight extra-bold))))
     (font-lock-comment-delimiter-face ((t (:foreground "white"))))
     (font-lock-comment-face ((t (:foreground "white"))))
     (font-lock-constant-face ((t (:bold t :foreground "white" :weight bold))))
     (font-lock-doc-face ((t (:italic t :slant italic :foreground "white"))))
     (font-lock-function-name-face ((t (:bold t :foreground "OliveDrab" :weight bold))))
     (font-lock-keyword-face ((t (:foreground "DarkOliveGreen3"))))
     (font-lock-negation-char-face ((t (nil))))
     (font-lock-preprocessor-face ((t (:foreground "Blue4"))))
     (font-lock-regexp-grouping-backslash ((t (:bold t :weight bold))))
     (font-lock-regexp-grouping-construct ((t (:bold t :weight bold))))
     (font-lock-string-face ((t (:italic t :foreground "white" :slant italic))))
     (font-lock-type-face ((t (:foreground "#9290ff"))))
     (font-lock-variable-name-face ((t (:italic t :bold t :foreground "gray45" :slant italic :weight bold))))
     (font-lock-warning-face ((t (:background "red" :foreground "yellow"))))
     (fringe ((t (:background "grey10" :foreground "gray90"))))
     (header-line ((t (:background "grey20" :foreground "grey90" :box nil))))
     (help-argument-name ((t (:italic t :slant italic))))
     (highlight ((t (nil))))
     (initz-list-module-face ((t (:foreground "green"))))
     (initz-list-node-face ((t (:foreground "cyan"))))
     (initz-list-unloaded-module-face ((t (:foreground "gray"))))
     (isearch ((t (:background "yellow"))))
     (isearch-fail ((t (:background "red4"))))
     (italic ((t (:italic t :slant italic))))
     (lazy-highlight ((t (:background "Goldenrod"))))
     (link ((t (:foreground "gray" :underline t))))
     (link-visited ((t (:underline t :foreground "black"))))
     (match ((t (:background "RoyalBlue3"))))
     (menu ((t (nil))))
     (minibuffer-prompt ((t (:foreground "white"))))
     (mode-line ((t (:background "gray30" :foreground "gray80"))))
     (mode-line-buffer-id ((t (:background "gray30" :foreground "gray80"))))
     (mode-line-emphasis ((t (:bold t :weight bold))))
     (mode-line-highlight ((t (:box (:line-width 2 :color "grey40" :style released-button)))))
     (mode-line-inactive ((t (:foreground "gray80" :background "gray30"))))
     (mouse ((t (nil))))
     (next-error ((t (nil))))
     (nobreak-space ((t (:foreground "gray10" :underline t))))
     (popup-face ((t (:background "lightgray" :foreground "black"))))
     (popup-isearch-match ((t (:background "sky blue"))))
     (popup-menu-face ((t (:background "lightgray" :foreground "black"))))
     (popup-menu-selection-face ((t (:background "steelblue" :foreground "white"))))
     (popup-scroll-bar-background-face ((t (:background "gray"))))
     (popup-scroll-bar-foreground-face ((t (:background "black"))))
     (popup-tip-face ((t (:background "khaki1" :foreground "black"))))
     (pp^L-highlight ((t (:box (:line-width 3 :style pressed-button)))))
     (query-replace ((t (:background "yellow"))))
     (region ((t (nil))))
     (rtf-brace-face ((t (:italic t :slant italic :foreground "white"))))
     (rtf-charescape-face ((t (:bold t :weight bold :foreground "OliveDrab"))))
     (rtf-cword-endingspace-face ((t (:foreground "white"))))
     (rtf-cword-face ((t (:foreground "DarkOliveGreen3"))))
     (rtf-cword-param-face ((t (:bold t :weight extra-bold))))
     (rtf-escnewline-face ((t (:bold t :weight bold :foreground "white"))))
     (rtf-escother-face ((t (:foreground "#9290ff"))))
     (rtf-esctab-face ((t (:foreground "yellow" :background "red"))))
     (rtf-loud-cword-face ((t (:foreground "yellow" :background "red"))))
     (rtf-star-face ((t (:italic t :foreground "white" :slant italic))))
     (rtf-trailing-whitespace-face ((t (nil))))
     (scroll-bar ((t (nil))))
     (secondary-selection ((t (:background "SkyBlue4"))))
     (semantic-highlight-edits-face ((t (:background "gray20"))))
     (semantic-unmatched-syntax-face ((t (:underline "red"))))
     (semantic-tag-boundary-face ((((class color) (background dark)) (:overline "black"))))
     (shadow ((t (:foreground "grey70"))))
     (sr-active-path-face ((t (:bold t :background "#ace6ac" :foreground "yellow" :weight bold :height 120))))
     (sr-alt-marked-dir-face ((t (:bold t :foreground "DeepPink" :weight bold))))
     (sr-alt-marked-file-face ((t (nil))))
     (sr-broken-link-face ((t (:italic t :foreground "red" :slant italic))))
     (sr-clex-hotchar-face ((t (:bold t :foreground "red" :weight bold))))
     (sr-compressed-face ((t (:foreground "magenta"))))
     (sr-directory-face ((t (:bold t :foreground "gray" :underline t :weight bold))))
     (sr-editing-path-face ((t (:bold t :background "red" :foreground "yellow" :weight bold :height 120))))
     (sr-encrypted-face ((t (:foreground "DarkOrange1"))))
     (sr-highlight-path-face ((t (:bold t :background "yellow" :foreground "#ace6ac" :weight bold :height 120))))
     (sr-html-face ((t (:foreground "DarkOliveGreen"))))
     (sr-log-face ((t (:foreground "white"))))
     (sr-marked-dir-face ((t (:bold t :foreground "black" :strike-through t :weight bold))))
     (sr-marked-file-face ((t (:foreground "black" :strike-through t))))
     (sr-packaged-face ((t (:foreground "DarkMagenta"))))
     (sr-passive-path-face ((t (:bold t :background "white" :foreground "lightgray" :weight bold :height 120))))
     (sr-symlink-directory-face ((t (:italic t :foreground "blue1" :slant italic))))
     (sr-symlink-face ((t (:italic t :foreground "DeepSkyBlue" :slant italic))))
     (sr-xml-face ((t (:foreground "DarkGreen"))))
     (tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :style released-button)))))
     (tooltip ((t (:foreground "black"))))
     (trailing-whitespace ((t (:background "slate gray"))))
     (underline ((t (:underline t))))
     (variable-pitch ((t (:family "Sans Serif"))))
     (vertical-border ((t (nil))))
     (widget-button ((t (:bold t :weight bold))))
     (widget-button-pressed ((t (:foreground "red1"))))
     (widget-documentation ((t (:foreground "lime green"))))
     (widget-field ((t (nil))))
     (widget-inactive ((t (:foreground "grey70"))))
     (widget-single-line-field ((t (:background "dim gray")))))))

(add-to-list 'color-themes '(my-color-theme  "DeTullio Dark" "Kenneth M. DeTullio"))

(require 'color-theme)
(setq color-theme-is-global t)
(my-color-theme)

;;(setq use-system-font t)

(require 'sr-speedbar)

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

;; (transient-mark-mode 0)

;; (setq ring-bell-function
;;       (lambda ()
;;         (unless (memq this-command
;;                       '(isearch-abort abort-recursive-edit exit-minibuffer keyboard-quit))
;;           (ding))))

;; ;; (require `sunrise-commander)

;; ;; (require 'rtf-mode)

(global-set-key [(control shift b)] 'recompile)
(global-set-key [(control shift x)] 'desktop-clear)
;; (global-set-key [(control x)(control meta x)] 'tags-search)
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
