(tool-bar-mode 0)
(menu-bar-mode 0)
(setq default-tab-width 4)
(setq visible-bell t)
(setq ring-bell-function 'ignore)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(current-language-environment "Japanese")
 '(custom-enabled-themes (quote (tango-dark)))
 '(display-battery-mode t)
 '(initial-frame-alist
   (quote
	((height . 65)
	 (width . 200)
	 (top . 8)
	 (left . 10)
	 (vertical-scroll-bars . right))))
 '(tab-width 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty" :foundry "unknown" :slant normal :weight normal :height 165 :width normal)))))
 
;; 追加el読み込みディレクトリ
;;(add-to-list 'load-path "~/.emacs.d/site-lisp")
(setq load-path
	  (append
	   (list
		(expand-file-name "~/.emacs.d/site-lisp/") ;追加
		(expand-file-name "~/.emacs.d/auto-install/"))
	          load-path))

;; autoインストールを使う際はコメントアウトを削除
;;(require 'auto-install)
;;(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
;;(auto-install-compatibility-setup)             ; 互換性確



;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)    ; 必須ではないですが一応
(global-auto-complete-mode t)
(setq ac-auto-start nil) ; 自動的に開始しない
(ac-set-trigger-key "TAB") ; コンテキストに応じてTABで補完

;; 行番号表示
(require 'linum)
(global-linum-mode)

;; 折り畳み
(add-hook 'c++-mode-hook
		  '(lambda ()
			 (hs-minor-mode 1)))
(add-hook 'c-mode-hook
		  '(lambda ()
			 (hs-minor-mode 1)))
(add-hook 'scheme-mode-hook
		  '(lambda ()
			 (hs-minor-mode 1)))
(add-hook 'emacs-lisp-mode-hook
		  '(lambda ()
			 (hs-minor-mode 1)))
(add-hook 'lisp-mode-hook
		  '(lambda ()
			 (hs-minor-mode 1)))
(add-hook 'python-mode-hook
		  '(lambda ()
			 (hs-minor-mode 1)))
(add-hook 'ruby-mode-hook
		  '(lambda ()
			 (hs-minor-mode 1)))
(define-key
  global-map
    (kbd "C-x C-a") 'hs-toggle-hiding)

;;php-mode
(require 'php-mode)
(setq php-mode-force-pear t) ;PEAR規約のインデント設定にする
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode)) ;*.phpのファイルのときにphp-modeを自動起動する

(add-hook 'php-mode-hook
		  (lambda ()
			(require 'php-completion)
			(php-completion-mode t)
			(define-key php-mode-map (kbd "C-q") 'phpcmp-complete)
			(when (require 'auto-complete nil t)
			  (make-variable-buffer-local 'ac-sources)
			  (add-to-list 'ac-sources 'ac-source-php-completion)
			               (auto-complete-mode t))))


;; タブバー
(require 'tabbar)
(tabbar-mode)
(global-set-key "\M-]" 'tabbar-forward)  ; 次のタブ
(global-set-key "\M-[" 'tabbar-backward) ; 前のタブ
;; タブ上でマウスホイールを使わない
(tabbar-mwheel-mode nil)
;; グループを使わない
(setq tabbar-buffer-groups-function nil)
;; 左側のボタンを消す
(dolist (btn '(tabbar-buffer-home-button
               tabbar-scroll-left-button
               tabbar-scroll-right-button))
  (set btn (cons (cons "" nil)
                 (cons "" nil))))

;; 外観変更
(set-face-attribute
 'tabbar-default nil
 :family "MeiryoKe_Gothic"
 :background "#34495E"
 :foreground "#EEEEEE"
 :height 0.95
 )
(set-face-attribute
 'tabbar-unselected nil
 :background "#34495E"
 :foreground "#EEEEEE"
 :box nil
)
(set-face-attribute
 'tabbar-selected nil
 :background "#E74C3C"
 :foreground "#EEEEEE"
 :box nil)
(set-face-attribute
 'tabbar-button nil
 :box nil)
(set-face-attribute
 'tabbar-separator nil
 :height 1.7)

