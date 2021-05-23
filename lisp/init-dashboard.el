;;; package --- Summary
;;; Commentary: 
 
;;; Code:
 
;; ------ Dashboard ------
 
(use-package dashboard
  :ensure
  :init
  (use-package all-the-icons :defer t :ensure t)
  (dashboard-setup-startup-hook)
  :config
  ;;(setq dashboard-banner-logo-title "Happy Emacs")
  (setq dashboard-startup-banner 1)
  (setq dashboard-items
        '((recents . 6)
          (bookmarks . 5)
          (projects . 6)
          (agenda . 5)))
  (setq dashboard-set-navigator nil)
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face)))

(provide 'init-dashboard)
 
;;; init-dashboard.el ends here
