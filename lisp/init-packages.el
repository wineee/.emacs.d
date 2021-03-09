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
	       ;; --- evil ---
	       evil
	       ;;  evil-leader
	       ;;  window-numbering
	       ;; evil-surround
	       ;; evil-nerd-commenter
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
