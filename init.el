(add-to-list 'load-path "~/.emacs.d/lisp")

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)


(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

;; Org-mode 管理 Emacs 配置
(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "org-file-name.org" user-emacs-directory))
