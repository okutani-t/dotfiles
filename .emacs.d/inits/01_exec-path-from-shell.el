;;; exec-path-from-shell .el

(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))
