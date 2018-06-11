(require 'multiple-cursors)
(require 'smartrep)

(declare-function smartrep-define-key "smartrep")

(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)

(global-unset-key "\C-q")

(smartrep-define-key global-map "C-q"
  '(("C-q"      . 'mc/mark-next-like-this)
    ("C-n"      . 'mc/mark-next-like-this)
    ("C-p"      . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'mc/reverse-regions)))
