
(defvar my/packages '(
	       ;; --- Auto-completion ---
	       company
	       rainbow-delimiters
	       ;; --- Better Editor ---
	       hungry-delete swiper
	       counsel smartparens
	       popwin expand-region
	       iedit helm-ag
	       auto-yasnippet

	       which-key 
	       ;; powerline
	       dired-ranger
	       ranger
	       meow
	       ;; --- Major Mode ---
	       js2-mode
	       go-mode
	       web-mode
	       elpy
	       ;; --- Minor Mode ---
	       nodejs-repl
	       js2-refactor
	       exec-path-from-shell
	       org-pomodoro
	       flycheck
	       
	       ;; --- Themes ---
	       monokai-theme
	       solarized-theme
	       kaolin-themes
	       nyan-mode
	       all-the-icons

	       ;; for eaf
	       ctable deferred epc s
	       use-package
	       ;; nox need
	       posframe
	       ;; netease music need
	       request
	       ;; git manger
	       magit
	       ) "Default packages")
(setq package-selected-packages my/packages)

;; (require-package 'el-get)

;; (setq use-package-always-ensure t)

(use-package popwin
  :ensure t
  :config
  (popwin-mode 1))

(use-package dired-ranger
  :ensure t
  :bind (:map dired-mode-map
              ("W" . dired-ranger-copy)
              ("X" . dired-ranger-move)
              ("Y" . dired-ranger-paste)))

(use-package which-key
  :ensure t
  :config
  (which-key-mode 1))

;; 删除连续多个空格
(use-package hungry-delete
  :ensure t
  :config
  (global-hungry-delete-mode)
  (setq hungry-delete-join-reluctantly t))

(use-package ivy
  :ensure t
  :diminish ivy-mode
  :hook (after-init . ivy-mode)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  (setq search-default-mode #'char-fold-to-regexp))

;;(require 'quelpa)
;;(quelpa '(eaf :fetcher github
;;              :repo  "manateelazycat/emacs-application-framework"
;;              :files ("*"))

(add-hook 'after-init-hook #'rainbow-delimiters-mode)
(add-hook 'emacs-lisp-mode-hook #'nyan-mode)


;;(setq mode-line-format
;;      (list
;;       '(:eval (list (nyan-create)))
;;       ))

(provide 'init-packages)
