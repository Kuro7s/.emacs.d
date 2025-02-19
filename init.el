(defun style-c-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))

(add-hook 'c++-mode-hook 'style-c-mode-hook)
(add-hook 'c-mode-hook 'style-c-mode-hook)

(setq-default indent-tabs-mode nil)

(tool-bar-mode -1)
(menu-bar-mode -1)

(setq inhibit-startup-screen t)

(setq create-lockfiles nil)
(setq backup-directory-alist
      `((".*" . "~/.emacs-saves")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-saves" t)))

(setq desktop-save 'if-exists)
(desktop-save-mode t)

(global-auto-revert-mode)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(set-message-beep 'silent)

(set-face-attribute 'default nil :family "JetBrains Mono" :height 105)

(setq-default show-trailing-whitespace t)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'nordic-night t)
