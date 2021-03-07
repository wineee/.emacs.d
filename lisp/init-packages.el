(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

;; vim like
;; (evil-mode 1) 
;; Insert State -> Emacs State 
;; (setq evil-leader/set-key-disable-insert-state-bindings 1)

;;(evil-leader/set-key

;;使用 Leader Key 与数字键的组合来在多个窗口之间进行跳转
;; (window-numbering-mode 1)

(which-key-mode 1)
;; 删除连续多个空格
(require 'hungry-delete)
(global-hungry-delete-mode)
(setq hungry-delete-join-reluctantly t)

;; popwin is a popup window manager for Emacs which makes you free from the hell of annoying buffers 
(require 'popwin)
(popwin-mode 1)

;; (require 'quelpa)
;; (quelpa '(eaf :fetcher github
;;              :repo  "manateelazycat/emacs-application-framework"
;;              :files ("*")))

;; (add-to-list 'load-path "~/.emacs.d/quelpa/build/eaf")
;; (require 'eaf)

(add-hook 'js2-mode-hook 'flycheck-mode)

;; yasnippet 是一个代码块补全的插件
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)
