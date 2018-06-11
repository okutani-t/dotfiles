;; drag-stuff
;; https://github.com/rejeep/drag-stuff.el

(require 'drag-stuff)
(drag-stuff-global-mode t)

(bind-key "M-p" 'drag-stuff-up)
(bind-key "M-n" 'drag-stuff-down)
