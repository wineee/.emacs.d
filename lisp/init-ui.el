;; 显示行号
(global-linum-mode 1)

;; 更改光标的样式
(setq-default cursor-type 'bar)

;; 关闭工具栏，tool-bar-mode 即为一个 Minor Mode
(tool-bar-mode -1)

;; 关闭菜单栏
(menu-bar-mode -1)

;; 关闭文件滚动条
(scroll-bar-mode -1)

;; 关闭启动帮助画面
(setq inhibit-splash-screen 1)

;; 高亮当前行
(global-hl-line-mode 1)

;; 标题栏显示文件及路径信息
(setq frame-title-format "%b [%I] %f GNU/Emacs")

;; 安装主题
(add-to-list 'my/packages 'monokai-theme)
(load-theme 'monokai 1)

;; 我们可以用下面代码将 Emacs 设置为开启默认全屏，
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; 更改显示字体大小 16pt
;; http://stackoverflow.com/questions/294664/how-to-set-the-font-size-in-emacs
(set-face-attribute 'default nil :height 160)

(provide 'init-ui)
