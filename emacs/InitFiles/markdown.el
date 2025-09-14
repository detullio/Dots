;; -*- lexical-binding: t; -*-

(use package markdown-mode
     ensure t
     mode("README\\.md\\'" gfm-mode)
     init (setw markdown command "pandoc")
     bind (:map markdown-mode-map
                ("C-c C-e' . mark-do)))
