;; 让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)

(setq dired-dwin-target 1)


;; https://github.com/ralesi/ranger.el

(ranger-override-dired-mode t)

;; helm-descbinds
(setq helm-descbinds-window-style 'same-window)

;; Hidden files (e.g. dotfiles) can be shown or hidden by pressing zh
(setq ranger-show-hidden t)

(setq ranger-parent-depth 2)


(provide 'init-dired)
