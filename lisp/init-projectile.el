
(use-package projectile
  :config
  (setq projectile-create-missing-test-files t)
  (setq projectile-enable-caching t)
  (setq projectile-require-project-root nil)
  (projectile-register-project-type
   'npm '("package.json")
   :compile "npm run build"
   :test "npm run test"
   :run "npm run start"
   :test-suffix ".spec"))

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-global-mode)

(provide 'init-projectile)
