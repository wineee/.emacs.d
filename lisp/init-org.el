;; 添加 Org-mode 文本内语法高亮
(require 'org)
(setq org-src-fontify-natively t)

;; 设置默认 Org Agenda 文件目录
(setq org-agenda-files '("~/org"))

;; 设置 org-agenda 打开快捷键
(global-set-key (kbd "C-c a") 'org-agenda)

;; (require 'org-install)
;; (require 'ob-tangle)
;; (org-babel-load-file (expand-file-name "org-file-name.org" user-emacs-directory))

(provide 'init-org)
