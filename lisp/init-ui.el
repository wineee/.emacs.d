;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式
(setq-default cursor-type 'bar)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭菜单栏
(menu-bar-mode -1)

(if (display-graphic-p)
    (progn
      ;; 关闭文件滚动条
      (scroll-bar-mode -1)))

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)
;; 高亮当前行
(global-hl-line-mode 1)

;; 标题栏显示文件及路径信息
(setq frame-title-format "%b [%I] %f GNU/Emacs")

;; (use-package nyan-mode :ensure t)
;; (add-hook 'emacs-lisp-mode-hook #'nyan-mode)

;; modeline 上的滑动栏
;;(use-package mlscroll
;;  :ensure t
;;  :init
;;  (which-function-mode 1)
;;  :config
;;  (setq mlscroll-shortfun-min-width 11) 
;;  (mlscroll-mode 1))

;; 安装主题
;;(use-package dracula-theme
;;  :ensure t
;;  :config
;;  (load-theme 'dracula t))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


(use-package all-the-icons
  :when (display-graphic-p)
  :demand t)

;; 我们可以用下面代码将 Emacs 设置为开启默认全屏，
;; (setq initial-frame-alist (quote ((fullscreen . maximized))))
;; (toggle-frame-fullscreen)

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

;;(use-package ivy-posframe
;;  :config
;;  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
;;  (ivy-posframe-mode 1))

(use-package ivy-rich)
(ivy-rich-mode 1)

;; M-x all-the-icons-install-fonts
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1)
  :config (setq inhibit-compacting-font-caches t))

(use-package doom-modeline
  :ensure t
  :defer t
  :hook
  (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-icon t)
  (doom-modeline-major-mode-icon nil)
  (doom-modeline-minor-modes nil)
  :config
  (line-number-mode t)
  (column-number-mode t))

(provide 'init-ui)
