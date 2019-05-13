;;; drag-stuff
;; https://github.com/rejeep/drag-stuff.el

(use-package drag-stuff)
(drag-stuff-global-mode t)

(bind-key "M-p" 'drag-stuff-up)
(bind-key "M-n" 'drag-stuff-down)
