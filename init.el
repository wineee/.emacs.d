;;(setq debug-on-error t)
(let ((minver "25.1"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "26.1")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

;; ------ 解决 Emacs GC 占用内存高的问题 ------
(setq gc-cons-threshold 100000000)

;; Adjust garbage collection thresholds during startup, and thereafter
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'emacs-startup-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lang" user-emacs-directory))

;; 快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d"))

(require 'init-elpa)
(require 'init-packages)
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
