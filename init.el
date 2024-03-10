(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes '(modus-vivendi))
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "JetBrainsMono NF" :foundry "outline" :slant normal :weight regular :height 102 :width normal)))))

(defun set-4-spaces-indentation()
    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 4)
    (setq indent-line-function 'insert-tab))

(add-hook 'c++-mode-hook
    (lambda() (set-4-spaces-indentation)))

(add-hook 'c-mode-hook
    (lambda() (set-4-spaces-indentation)))

(add-hook 'emacs-lisp-mode-hook
    (lambda() (set-4-spaces-indentation)))
