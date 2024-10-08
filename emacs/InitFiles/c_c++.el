
(setq-default indent-tabs-mode nil)

(add-hook 'c-mode-common-hook `subword-mode)
(add-hook 'c-mode-common-hook 'hs-minor-mode)
(add-hook 'c-mode-common-hook 'google-set-c-style)

(require 'eglot)

(add-to-list 'eglot-server-programs '((c++-mode c-mode) "clangd"))

(add-hook 'c-mode-hook 'eglot-ensure)

(add-hook 'c++-mode-hook 'eglot-ensure)

;; (add-hook 'c-mode-common-hook 'c-basic-offset 4)
;; (add-hook 'c-mode-common-hook 'custom-buffer-indent 4)
;; (add-hook 'c-mode-common-hook 'standard-indent 4)

;;(setq-default c-default-style (quote ((c-mode . "google-set-c-style") (c++-mode . "google-set-c-style") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))

;; (setq c-mode-hook nil)
;; (setq c-report-syntactic-errors t)
;; (setq c-echo-syntactic-information-p t)
