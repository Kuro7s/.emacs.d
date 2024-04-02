;; Package managment (Some things taken from: https://github.com/Bassmann/emacs-config/blob/master/init.el)
(require 'package)

(setq package-archives
      '(("GNU ELPA" . "https://elpa.gnu.org/packages/")
        ("MELPA" . "https://melpa.org/packages/")
        ("NONGNU" . "https://elpa.nongnu.org/nongnu/")))

(when (version< emacs-version "27.0") (package-initialize))

(unless (package-installed-p 'projectile)
    (package-refresh-contents)
    (package-install 'projectile t))

;; Projectile
(projectile-mode +1)

(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

;; Theme
(load-theme 'wheatgrass)

;; Indentation
;; Mode specific indentation
(setq-default c-basic-offset 4)
(setq-default lisp-body-indent 4)

(setq-default truncate-lines t)

(setq-default indent-tabs-mode nil)

;; Set the directory for backup files
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; Set the directory for auto-save files
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-saves/" t)))

;; Disable the creation of lock files
(setq create-lockfiles nil)

;; Font
(ignore-errors (set-face-attribute 'default nil :font "JetBrains Mono" :height 102))

;; Custom
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(display-line-numbers-type 'relative)
 '(global-display-line-numbers-mode t)
 '(inhibit-startup-screen t)
 '(menu-bar-mode nil)
 '(package-selected-packages '(projectile rust-mode zenburn-theme catppuccin-theme))
 '(tool-bar-mode nil)
 '(tooltip-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
