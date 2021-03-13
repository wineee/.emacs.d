(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; Emacs China 中文社区在国内搭建的一个 ELPA 镜像

(require 'cl)
;; Add Packages
(defvar my/packages '( 		      
	       ;; --- Auto-completion ---
	       company
	       ;; --- Better Editor ---
	       hungry-delete
	       swiper
	       counsel
	       smartparens
	       popwin
	       expand-region
	       iedit
	       helm-ag
	       auto-yasnippet

	       which-key
	       ;; powerline
	       
	       ;; --- Major Mode ---
	       js2-mode
	       go-mode
	       web-mode
	       
	       ;; --- Minor Mode ---
	       nodejs-repl
	       js2-refactor
	       exec-path-from-shell
	       org-pomodoro
	       flycheck
	       
	       ;; --- Themes ---
	       monokai-theme
	       ;; --- Pkg Maneger
	       quelpa

	       ;; for eaf
	       ctable
	       deferred
	       epc
	       s

	       use-package
	       ) "Default packages")

(setq package-selected-packages my/packages)

(defun my/packages-installed-p ()
    (loop for pkg in my/packages
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))

(unless (my/packages-installed-p)
    (message "%s" "Refreshing package database...")
    (package-refresh-contents)
    (dolist (pkg my/packages)
      (when (not (package-installed-p pkg))
	(package-install pkg))))


(use-package popwin
  :config
  (popwin-mode 1))

(use-package which-key
  :config
  (which-key-mode 1))

;; 删除连续多个空格
(use-package hungry-delete
  :config
  (global-hungry-delete-mode)
  (setq hungry-delete-join-reluctantly t))



(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
;; enable this if you want `swiper' to use it
;; (setq search-default-mode #'char-fold-to-regexp)


;;(require 'quelpa)
;;(quelpa '(eaf :fetcher github
;;              :repo  "manateelazycat/emacs-application-framework"
;;              :files ("*")))

(use-package eaf
  :load-path "~/.emacs.d/site-lisp/emacs-application-framework" 
  :init
  (use-package epc :defer t :ensure t)
  (use-package ctable :defer t :ensure t)
  (use-package deferred :defer t :ensure t)
  (use-package s :defer t :ensure t)
  :custom
  (eaf-browser-continue-where-left-off t)
  :config
  (eaf-setq eaf-browser-enable-adblocker "true")
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)) ;;

(setq eaf-proxy-type "http")
(setq eaf-proxy-host "127.0.0.1")
(setq eaf-proxy-port "8889")

(add-hook 'js2-mode-hook 'flycheck-mode)

;; yasnippet 是一个代码块补全的插件
;; (yas-reload-all)
;; (add-hook 'prog-mode-hook #'yas-minor-mode)

(provide 'init-packages)
