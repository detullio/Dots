(setq ollama-buddy-openai-api-key "sk-eb3950eb951e47f5bd0b21735b99228a")

(use-package ollama-buddy
  :ensure t
  :bind
  ("C-c o" . ollama-buddy-role-transient-menu)
  ("C-c O" . ollama-buddy-transient-menu)
  :config
  (require 'ollama-buddy-provider)
  (ollama-buddy-provider-create
   :name "Mike Intelligence Server"
   :prefix "l:"
   :endpoint "http://127.0.0.1:11434/api/chat/"
   :models-endpoint "http://127.0.0.1:11434/api/models"
   :api-key (lambda () (auth-source-pick-first-password :host "ollama-buddy-openai" :user "apikey"))
   ))

(setq ollama-buddy-rag-embedding-base-url "http://127.0.0.1:11434")
(setq ollama-buddy-rag-embedding-api-style 'openai)
(setq ollama-buddy-rag-embedding-model "nomic-embed-text")


;;   (ollama-buddy-provider-create
;;    :name "Algernon Intelligence Server"
;;    :prefix "l:"
;;    ;;   :endpoint "http://192.168.42.13:11434/api/chat"
;;    ;;   :models-endpoint "http://192.168.42.13:11434/api/tags"
;;    :endpoint "http://192.168.42.13:8080/api/chat"
;;    :models-endpoint "http://192.168.42.13:8080/api/models"
;;    :api-key (lambda () (auth-source-pick-first-password :host "ollama-buddy-openai" :user "apikey"))
;;    ))

;; ;;(setq ollama-buddy-rag-embedding-base-url "http://192.168.42.13:11434")
;; (setq ollama-buddy-rag-embedding-base-url "http://192.168.42.13:8080")
;; (setq ollama-buddy-rag-embedding-api-style 'openai)
;; ;;(setq ollama-buddy-rag-embedding-api-style 'ollama)
;; (setq ollama-buddy-rag-embedding-model "nomic-embed-text")
