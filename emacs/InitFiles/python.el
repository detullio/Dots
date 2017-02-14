(setq my_python-mode-common-hook (quote ((lambda nil (camelCase-mode 1)) (lambda nil (hs-minor-mode 1)))))
(add-hook 'python-mode-common-hook 'my-python-mode-common-hook)
