(add-to-list 'load-path "~/.emacs.d/site-lisp/nox")

(use-package posframe :ensure t)
(use-package nox
  :ensure nil
  :config
  (dolist (hook (list
               'js-mode-hook
               'rust-mode-hook
               'python-mode-hook
               'ruby-mode-hook
               'java-mode-hook
               'sh-mode-hook
               'php-mode-hook
               'c-mode-common-hook
               'c-mode-hook
               'csharp-mode-hook
               'c++-mode-hook
               'haskell-mode-hook
               ))
  (add-hook hook '(lambda () (nox-ensure))))
  (add-to-list 'nox-server-programs
             `(python-mode . ("pyls" "-v" "--tcp" "--host"
                              "localhost" "--port" :autoport)))
  )



(provide 'init-nox)
