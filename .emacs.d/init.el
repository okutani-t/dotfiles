;;; init.el

;; for straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; use-package
(straight-use-package 'use-package)

;; use-packageをstraight.elにフォールバック(straight-use-package -> use-package)
(setq straight-use-package-by-default t)

(use-package bind-key)

;;; hidden log
(setq init-loader-show-log-after-init 'error-only)

(use-package init-loader)
(init-loader-load "~/.emacs.d/inits")
