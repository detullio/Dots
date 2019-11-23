
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


(setq my_c-mode-common-hook (quote ((lambda nil (camelCase-mode 1)) (lambda nil (hs-minor-mode 1)))))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
