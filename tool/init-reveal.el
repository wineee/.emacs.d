;; org 写幻灯片的神器
;;; https://github.com/yjwen/org-reveal

;;Requirements and Installation
;; Reveal.js
;; Org-mode
;; ox-reveal.el
;; htmlize.el (optional, for syntax highlighting).


;; npm install reveal.js

(use-package ox-reveal
  :ensure t
  :defer t
  :init
  (use-package htmlize :defer t :ensure t)
  :config
  (setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
  (setq org-reveal-mathjax t))

(provide 'init-reveal)

;;; init-reveal end here
