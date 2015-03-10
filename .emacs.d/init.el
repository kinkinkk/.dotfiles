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
 '(tab-width 4)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ricty for Powerline" :foundry "unknown" :slant normal :weight normal :height 108 :width normal)))))

;; 追加el読み込みディレクトリ
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)    ; 必須ではないですが一応
(global-auto-complete-mode t)
(setq ac-auto-start nil) ; 自動的に開始しない
(ac-set-trigger-key "TAB") ; コンテキストに応じてTABで補完


;;php-mode
(load "php-mode")
