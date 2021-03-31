;; https://github.com/ralesi/ranger.el

(ranger-override-dired-mode t)

;; helm-descbinds
(setq helm-descbinds-window-style 'same-window)

;; Hidden files (e.g. dotfiles) can be shown or hidden by pressing zh
(setq ranger-show-hidden t)

(setq ranger-parent-depth 2)


(provide 'init-dired)
