(use-package magit
  :init
  (use-package magit-blame)
  :bind (("C-c g c" . magit-checkout)
         ("C-c g f c" . magit-file-checkout)))

(provide 'init-magit)
