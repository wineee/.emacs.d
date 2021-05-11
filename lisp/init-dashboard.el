;;; package --- Summary
;;; Commentary:
 
 
;;; Code:
 
;; ------ Dashboard ------
 
(use-package dashboard
  :ensure
  :init
  (dashboard-setup-startup-hook)
  :config
  ;;(setq dashboard-banner-logo-title "Happy Emacs")
  (setq dashboard-startup-banner 1)
  (setq dashboard-items
        '((recents . 5)
          (bookmarks . 5)
          (projects . 3)
          (agenda . 5)))
  (setq dashboard-set-navigator t)
  (setq dashboard-navigator-buttons
      `(;; line1
        ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
         "Homepage"
         "Browse homepage"
         (lambda (&rest _) (browse-url "homepage")))
        ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
        ("?" "" "?/h" #'show-help nil "<" ">"))
         ;; line 2
        ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
          "Linkedin"
          ""
          (lambda (&rest _) (browse-url "homepage")))
         ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))
  (setq dashboard-footer-icon (all-the-icons-octicon "dashboard"
                                                   :height 1.1
                                                   :v-adjust -0.05
                                                   :face 'font-lock-keyword-face)))

(provide 'init-dashboard)
 
;;; init-dashboard.el ends here
