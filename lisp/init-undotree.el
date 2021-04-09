(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode)
  (defadvice undo-tree-visualizer-mode (after undo-tree-face activate)
    (buffer-face-mode)))

(provide 'init-undotree)

;; C-x u 进入 undo-tree-visualizer-mode ,
;; p n   上下移动，
;; b f    在分支左右切换，
;; t 显示时间戳，选定需要的状态后，
;; q 退出。
