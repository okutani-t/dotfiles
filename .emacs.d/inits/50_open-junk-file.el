;; open-junk-file

(require 'open-junk-file)
(setq open-junk-file-format "~/.emacs.d/junk_file/%Y-%m-%d-%H%M%S.")
(global-set-key (kbd "C-x j") 'open-junk-file)
