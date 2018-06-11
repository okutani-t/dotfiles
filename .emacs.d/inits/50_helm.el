;; helm

;; helm設定
(require 'helm)
(require 'helm-mode)
(require 'helm-config)
(require 'helm-rdefs)

;; 自動補完を無効にする
(setq helm-ff-auto-update-initial-value nil)

;; For find-file etc.TAB補完
(bind-key "TAB" 'helm-execute-persistent-action helm-read-file-map)

;; For helm-find-files etc.TAB補完
(bind-key "TAB" 'helm-execute-persistent-action helm-find-files-map)

;; TAB補完でファイルが無かった場合何もしない
(defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
  "Execute command only if CANDIDATE exists"
  (when (file-exists-p candidate)
    ad-do-it))

;; ミニバッファでC-hをバックスペースに割り当て
(bind-key "C-h" 'delete-backward-char helm-map)
(bind-key "C-h" 'delete-backward-char helm-find-files-map)

;; helm用のコマンドに変更（中身はぐぐってください）
(bind-key "M-x"     'helm-M-x)
(bind-key "C-r"     'helm-recentf)
(bind-key "C-x C-r" 'helm-recentf)
(bind-key "M-y"     'helm-show-kill-ring)
(bind-key "S-y"     'helm-show-kill-ring)
(bind-key "C-c i"   'helm-imenu)
(bind-key "C-c m"   'helm-mini)
(bind-key "C-x b"   'helm-buffers-list)
(bind-key "C-x d"   'helm-find-files)
(bind-key "C-x C-d" 'helm-find-files)
(bind-key "C-x C-f" 'helm-for-files)
(bind-key* "C-c C-l" 'helm-ls-git-ls)
(bind-key "C-c C-g" 'helm-git-grep)
(bind-key "TAB" 'helm-execute-persistent-action helm-find-files-map)
(bind-key "TAB" 'helm-execute-persistent-action helm-read-file-map)

;; helm-swoop検索
(global-set-key (kbd "M-i") 'helm-swoop)
;; helm-swoop実行中にhelm-multi-swoop-allに移行
(bind-key "M-i" 'helm-multi-swoop-all-from-helm-swoop helm-swoop-map)
;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)

;; helm migemo
(require 'migemo)
(helm-migemo-mode 1)
