(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

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
	       ;; --- Major Mode ---
	       js2-mode
	       go-mode
	       web-mode
	       
	       ;; --- Minor Mode ---
	       nodejs-repl
	       js2-refactor
	       exec-path-from-shell
	       ;; --- Themes ---
	       monokai-theme
	       ;; --- Pkg Maneger
	       quelpa
	       ;; for eaf
	       ctable
	       deferred
	       epc
	       s
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

;; 删除连续多个空格
(require 'hungry-delete)
(global-hungry-delete-mode)
(setq hungry-delete-join-reluctantly t)

;; popwin is a popup window manager for Emacs which makes you free from the hell of annoying buffers 
(require 'popwin)
(popwin-mode 1)

(require 'quelpa)
(quelpa '(eaf :fetcher github
              :repo  "manateelazycat/emacs-application-framework"
              :files ("*")))

(add-to-list 'load-path "~/.emacs.d/quelpa/build/eaf")
(require 'eaf)

(provide 'init-packages)
