;;; init-yaml.el --- Support Yaml files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'yaml-mode)
  (setq auto-mode-alist
      (append
       '(("\\.yml\\.erb\\'" . yaml-mode))
       auto-mode-alist))
  (add-hook 'yaml-mode-hook 'goto-address-prog-mode))


(provide 'init-yaml)
;;; init-yaml.el ends here
