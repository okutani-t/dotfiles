;;; init.el

(package-initialize)

;; Macの場合
(when (equal system-type 'darwin)
  (require 'cask)
)
;; Linuxの場合
(when (equal system-type 'gnu/linux)
  (require 'cask "~/.cask/cask.el")
)
(cask-initialize)

;; bind-key
(require 'bind-key)

;; init-loader.el
(require 'init-loader)
;; logを表示させない
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/inits")
