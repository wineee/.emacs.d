;; Elpy, the Emacs Python IDE
;; https://elpy.readthedocs.io/en/latest/index.html

(use-package elpy
  :ensure t
  :defer t
  :init
  (advice-add 'python-mode :before 'elpy-enable))

(elpy-enable)

;;Configuration:  M-x elpy-config
