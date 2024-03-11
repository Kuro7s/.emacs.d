(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(custom-enabled-themes '(wheatgrass))
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

;; Mode specific indentation
(setq-default c-basic-offset 4)
(setq-default lisp-body-indent 4)

(setq-default truncate-lines t)

;; Stop emacs from making backup and recovery files in the same directory as the original files.

; Set the directory for backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

; Set the directory for auto-save files
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-saves/" t)))

; Disable the creation of lock files
(setq create-lockfiles nil)
