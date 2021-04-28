;; https://github.com/SpringHan/netease-cloud-music.el/blob/master/README_cn.org

(add-to-list 'load-path "~/.emacs.d/site-lisp/netease-cloud-music.el")

(use-package netease-cloud-music
  :init
  (use-package request :defer t :ensure t)
  :config
  (setq netease-cloud-music-player-command '("mpv" "pause\n" "seek 5" "seek -5"))
)
    

(provide 'init-music)
