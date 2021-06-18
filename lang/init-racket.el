(use-package racket-mode)
;; (use-package paredit-mode)
;; https://www.jianshu.com/p/9f09896ebc08
(setq racket-racket-program "racket")
(setq racket-raco-program "raco")
(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "C-x C-j") 'racket-run)))
(setq tab-always-indent 'complete) ;; 使用tab自动补全

(provide 'init-racket)

;; init-racket ends here
