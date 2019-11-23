(deftheme KDeT
  "Created 2019-11-23.")

(custom-theme-set-variables
 'KDeT
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"]))

(custom-theme-set-faces
 'KDeT
 '(default ((t (:background "dark slate gray" :foreground "black"))))
 '(cursor ((t (:background "black"))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(escape-glyph ((((class color) (min-colors 89)) (:foreground "#ddaa6f" :weight bold))))
 '(minibuffer-prompt ((((class color) (min-colors 89)) (:foreground "#e5786d"))))
 '(highlight ((((class color) (min-colors 89)) (:background "#454545" :foreground "#ffffff" :underline t))))
 '(region ((((class color) (min-colors 89)) (:background "#444444" :foreground "#f6f3e8"))))
 '(shadow ((((class color grayscale) (min-colors 88) (background light)) (:foreground "grey50")) (((class color grayscale) (min-colors 88) (background dark)) (:foreground "grey70")) (((class color) (min-colors 8) (background light)) (:foreground "green")) (((class color) (min-colors 8) (background dark)) (:foreground "yellow"))))
 '(secondary-selection ((((class color) (min-colors 89)) (:background "#333366" :foreground "#f6f3e8"))))
 '(trailing-whitespace ((((class color) (background light)) (:background "red1")) (((class color) (background dark)) (:background "red1")) (t (:inverse-video t))))
 '(font-lock-builtin-face ((((class color) (min-colors 89)) (:foreground "#e5786d"))))
 '(font-lock-comment-delimiter-face ((t (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "white"))))
 '(font-lock-constant-face ((((class color) (min-colors 89)) (:foreground "#e5786d"))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-function-name-face ((((class color) (min-colors 89)) (:foreground "#cae682"))))
 '(font-lock-keyword-face ((((class color) (min-colors 89)) (:foreground "#8ac6f2" :weight bold))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-regexp-grouping-backslash ((t (:inherit (bold)))))
 '(font-lock-regexp-grouping-construct ((t (:inherit (bold)))))
 '(font-lock-string-face ((((class color) (min-colors 89)) (:foreground "#95e454"))))
 '(font-lock-type-face ((((class color) (min-colors 89)) (:foreground "#92a65e" :weight bold))))
 '(font-lock-variable-name-face ((((class color) (min-colors 89)) (:foreground "#cae682"))))
 '(font-lock-warning-face ((((class color) (min-colors 89)) (:foreground "#ccaa8f"))))
 '(button ((((class color) (min-colors 89)) (:background "#333333" :foreground "#f6f3e8"))))
 '(link ((((class color) (min-colors 89)) (:foreground "#8ac6f2" :underline t))))
 '(link-visited ((((class color) (min-colors 89)) (:foreground "#e5786d" :underline t))))
 '(fringe ((((class color) (min-colors 89)) (:background "#303030"))))
 '(header-line ((((class color) (min-colors 89)) (:background "#303030" :foreground "#e7f6da"))))
 '(tooltip ((t (:foreground "black" :background "lightyellow" :inherit (variable-pitch)))))
 '(mode-line ((((class color) (min-colors 89)) (:background "#444444" :foreground "#f6f3e8"))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(mode-line-inactive ((((class color) (min-colors 89)) (:background "#444444" :foreground "#857b6f"))))
 '(isearch ((((class color) (min-colors 89)) (:background "#343434" :foreground "#857b6f"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(lazy-highlight ((((class color) (min-colors 89)) (:background "#384048" :foreground "#a0a8b0"))))
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(next-error ((t (:inherit (region)))))
 '(query-replace ((t (:inherit (isearch))))))

(provide-theme 'KDeT)
