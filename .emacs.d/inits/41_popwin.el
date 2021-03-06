;;; popwin
;; https://git.framasoft.org/distopico/distopico-dotemacs/blob/3d4adf0d21d9ed49e9ce8072672916e0c41cdbc6/emacs/modes/conf-popwin.el

(use-package popwin)

(popwin-mode 1)

(setq pop-up-windows nil)

;; helm
(push '("^\\*helm" :regexp t :height 20) popwin:special-display-config)
(push '("^\\*helm-rdefs" :regexp t :height 20) popwin:special-display-config)

;; Flycheck
(push '(flycheck-error-list-mode :stick t) popwin:special-display-config)
;; metahelp
(push '("*Metahelp*" :height 10) popwin:special-display-config)
;; quickrun
(push '("*quickrun*" :height 10) popwin:special-display-config)
;; eshell
(push '("*eshell*" :height 10) popwin:special-display-config)
;; grep
(push '("*grep*" :noselect t :height 10) popwin:special-display-config)
;; undo-tree
(push '("*undo-tree*" :width 0.3 :position right) popwin:special-display-config)
;; M-!
(push "*Shell Command Output*" popwin:special-display-config)
;; Debug
(push '("*Backtrace*" :height 0.3 ) popwin:special-display-config)
(push '("*Messages*" :height 0.3 ) popwin:special-display-config)
(push '("*Compile-Log*" :height 0.3 ) popwin:special-display-config)
;; yasnippet tables
(push '("*YASnippet tables*" :height 10) popwin:special-display-config)
;; Backtrace
(push '("*Backtrace*" :height 10) popwin:special-display-config)
;; magit
(push '("*magit-edit-log*" :height 25) popwin:special-display-config)
(push '("*magit-commit*" :height 25) popwin:special-display-config)
(push '("*magit-diff*" :height 25) popwin:special-display-config)
(push '(magit-status-mode :height 25) popwin:special-display-config)
;; rspec-mode
(push '("*rspec-compilation*" :height 15) popwin:special-display-config)
