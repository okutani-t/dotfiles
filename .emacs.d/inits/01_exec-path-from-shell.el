;;; exec-path-from-shell .el
;; import zsh path

(use-package exec-path-from-shell)

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
