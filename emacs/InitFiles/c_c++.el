;; -*- lexical-binding: t; -*-

(setq-default indent-tabs-mode nil)

(add-hook 'c-mode-common-hook `subword-mode)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(require 'eglot)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))

(add-hook 'c-mode-hook 'eglot-ensure)

(add-hook 'c++-mode-hook 'eglot-ensure)

(setq-default c-default-style (quote ((c-mode . "stroustrup") (c++-mode . "stroustrup") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))

(setq c-mode-hook nil)
(setq c-report-syntactic-errors t)
(setq c-echo-syntactic-information-p t)

(defalias 'SourceClean (read-kbd-macro
                        "<C-home> C-SPC <C-end> M-x untabify TAB RET <C-home> M-x repl TAB rege TAB RET 2*SPC * RET SPC RET <C-home> C-SPC <C-end> M-x inden TAB - reg TAB RET"))
