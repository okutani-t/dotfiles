;; helm etags plus

(use-package helm-etags-plus)

(bind-key* "M-." 'helm-etags-plus-select)
(bind-key* "M-*" 'helm-etags-plus-history)
(bind-key* "M-," 'helm-etags-plus-history-go-back)
(bind-key* "C-c M-/" 'helm-etags-plus-history-go-forward)
