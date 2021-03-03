;; 禁止 Emacs 自动生成备份文件
(setq make-backup-files nil)

;; 关闭自动保存文件
(setq auto-save-default nil)

;; 设置一个别名将其简化为只输入 (y or n)
(fset 'yes-or-no-p 'y-or-n-p)

;; 其他编辑器修 改文件后，自动从硬盘加载
(global-auto-revert-mode t)

;; 启用自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; 开启全局 Company 补全
(global-company-mode 1)

;; 关闭自动缩进
;; (electric-indent-mode -1)

;; 加入最近打开过文件的选项
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;; 选中一段文字 之后输入一个字符会替换掉你选中部分的文字
(delete-selection-mode 1)

;; 扩号
(require 'smartparens-config)
(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)

;; 缩写补全
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table'(
					   ("k8s" "kubernetes")
					   ))
;; 重新缩进所选区域的代码
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indent selected region."))
      (progn
	(indent-buffer)
	(message "Indent buffer.")))))

;; Company 有时候补全功能并不是非常理想，这时就可以使用 Hippie Expand 来完成补全
(setq hippie-expand-try-function-list '(try-expand-debbrev
					try-expand-debbrev-all-buffers
					try-expand-debbrev-from-kill
					try-complete-file-name-partially
					try-complete-file-name
					try-expand-all-abbrevs
					try-expand-list
					try-expand-line
					try-complete-lisp-symbol-partially
					try-complete-lisp-symbol))

;; 让 Emacs 重用唯一的一个缓冲区作为 Dired Mode 显示专用缓冲区
(put 'dired-find-alternate-file 'disabled nil)

;; 主动加载 Dired Mode
;; (require 'dired)
;; (defined-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)

;; 延迟加载
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)

(setq dired-dwin-target 1)

;; Occur 与普通的搜索模式不同的是，它可以使用 Occur-Edit Mode (在弹出的窗口中按 e 进入编辑模式) 对搜索到的结果进行之间的编辑
(defun occur-dwim ()
  "Call `occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))
(global-set-key (kbd "M-s o") 'occur-dwim)

;; 自动切换透明度
(defun rew-toggle-frame-transparency ()
  (interactive)
  (if (equal (frame-parameter nil 'alpha) 100)
      (set-frame-parameter nil 'alpha '(90 . 85))
    (set-frame-parameter nil 'alpha 100)))

(provide 'init-better-defaults)
