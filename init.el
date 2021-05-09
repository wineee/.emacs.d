;;(setq debug-on-error t)
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; ------ 解决 Emacs GC 占用内存高的问题 ------
(setq gc-cons-threshold 100000000)

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lang" user-emacs-directory))

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d"))

(require 'init-elpa)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer nil)
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t))
(eval-when-compile
  (require 'use-package))

(require 'init-packages)
(require 'init-dashboard)
(require 'init-undotree)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
(require 'init-eaf)
(require 'init-dired)
(require 'init-meow)
(require 'init-music)
(require 'init-nox)
(require 'init-yasnippet)
(require 'init-diminish)
(require 'init-projectile)

(require 'init-go)
(require 'init-haskell)
(require 'init-cpp)
(require 'init-js)
(require 'init-nix)
(require 'init-haskell)
(require 'init-toml)
(require 'init-yaml)
(require 'init-sql)

(require-package 'sudo-edit)
(require-package 'gnuplot)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)

(provide 'init)
;;; init.el ends here
