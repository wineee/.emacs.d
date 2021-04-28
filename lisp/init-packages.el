;; (setq use-package-always-ensure t)

(use-package company :ensure t)
(use-package swiper :ensure t)
(use-package iedit :ensure t)
(use-package expand-region :ensure t)
(use-package helm-ag :ensure t)
(use-package elpy :ensure t)

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
(use-package rainbow-delimiters
  :ensure t)
(add-hook 'after-init-hook #'rainbow-delimiters-mode)
(use-package nyan-mode :ensure t)
(add-hook 'emacs-lisp-mode-hook #'nyan-mode)


;;(setq mode-line-format
;;      (list
;;       '(:eval (list (nyan-create)))
;;       ))

(provide 'init-packages)
