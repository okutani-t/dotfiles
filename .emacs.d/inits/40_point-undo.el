;; point-undo

(when (require 'point-undo nil t)
  (define-key global-map [f7] 'point-undo)
  (define-key global-map [S-f7] 'point-redo))
