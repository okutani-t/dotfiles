;; init

;; common lisp
(require 'cl)

;; macのみright commandをmetaキーに割り当て
(when (equal system-type 'darwin)
  (setq mac-right-command-modifier 'meta)
)

;; yes or noをy or n
(fset 'yes-or-no-p 'y-or-n-p)

;; 音消去
(setq ring-bell-function 'ignore)

;; 1行ずつスクロール
(setq scroll-conservatively 35
      scroll-margin 0
      scroll-step 1)
(setq comint-scroll-show-maximum-output t) ;; shell-mode

;; C-x bでミニバッファにバッファ候補を表示
(iswitchb-mode t)

;; ファイル末の改行がなければ追加
(setq require-final-newline t)

;; コピー内容をクリップボードと共有する設定
(setq x-select-enable-clipboard t)

;; elisp関数や変数をエコーエリアに表示
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

;; 最近使ったファイルをメニューに表示
(recentf-mode t)

;; 閉じカッコの自動挿入
(electric-pair-mode 1)

;; 履歴を次回emacs起動時にも保存する
(savehist-mode 1)

;; インデントにタブ文字を使用しない
(setq-default indent-tabs-mode nil)

;; TAB幅指定
(setq default-tab-width 4)

;; 165が¥（円マーク） , 92が\（バックスラッシュ）を表す
(define-key global-map [165] [92])
