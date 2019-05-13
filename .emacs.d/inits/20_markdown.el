;;; markdown-mode

(use-package markdown-mode)

(setq auto-mode-alist (cons '("\\.md" . gfm-mode) auto-mode-alist))
