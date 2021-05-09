;;; package --- Summary
;;; Commentary:
 
 
;;; Code:
 
;; ------ Dashboard ------
 
(use-package dashboard
  :ensure
  :init
  (dashboard-setup-startup-hook)
  :config
  (setq dashboard-banner-logo-title "Happy Emacs")
  (setq dashboard-startup-banner "~/.emacs.d/logo.png")
  (setq dashboard-items
        '((recents . 5)
          (bookmarks . 5)
          (projects . 3)
          (agenda . 5))))
 
(provide 'init-dashboard)
 
;;; init-dashboard.el ends here
