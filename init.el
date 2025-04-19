;; -- IMPORTANT NOTES (Should start using org-mode to keep track of these at some point. Don't know how convinient that would be really... I'm not a heavy emacs user so...) --

;; - Terminal and shell setup notes; Just a reminder that has nothing to do with emacs.
;; I use the windows terminal with cmd as the default prompt(The one that comes runs vcvarsXX.bat at the startup, "Developer Command Prompt for VS 2022" I believe) and clink with "clink.default_bindings" set to "bash" so i can use the emacs key bindings within cmd.
;; I also like to modify the "Starting directory" to whatever my current workspace directory is, in the profile of the previously said "dev blah blah prompt".

;; Defining %HOME% as a user environment variable is also a pretty good idea so emacs thinks ~/ is the user directory on windows. In emacs "~" or home is set to %APPDATA% by default on windows.

;; -- package.el Initialization --

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Key bindings

;; move line up
(defun move-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line 2))

;; move line down
(defun move-line-down ()
  (interactive)
  (next-line 1)
  (transpose-lines 1)
  (previous-line 1))

(global-set-key (kbd "C-'") 'move-line-up)
(global-set-key (kbd "C-;") 'move-line-down)

(global-set-key (kbd "M-p") (kbd "C-<up>"))
(global-set-key (kbd "M-n") (kbd "C-<down>"))

(global-set-key (kbd "M-RET") #'compile)

;; -- Cool Stuff --

;; Non vcs-staged file with (mostly) personal stuff in it.
(setq local-stuff-file (concat user-emacs-directory "local-stuff.el"))
(when (file-exists-p local-stuff-file)
  (load local-stuff-file))

(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(setq ido-create-new-buffer 'always)
(setq-default confirm-nonexistent-file-or-buffer nil)

(ido-mode t)

(global-auto-revert-mode)

;; -- Code Style and language specific helpers --

;; C/C++ indentation
(defun style-c-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))

(add-hook 'c++-mode-hook 'style-c-mode-hook)
(add-hook 'c-mode-hook 'style-c-mode-hook)

(setq-default indent-tabs-mode nil)

;; C/C++ helpers
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; -- Bullshit Removal --

;;                  Fuck this
;;                      |
;;                     \|/
;;                      -
(setq ido-auto-merge-work-directories-length -1) ;; <--- Fuck this
;;                      -
;;                     /|\
;;                      |
;;                  Fuck this

(tool-bar-mode -1)
(menu-bar-mode -1)

;; I hate the emacs startup screen, it looks stupid.
(setq inhibit-startup-screen t)

(setq create-lockfiles nil)
(setq backup-directory-alist
      `((".*" . "~/.emacs-saves")))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs-saves" t)))

(set-message-beep 'silent)

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; -- Performance --

;; The variable redisplay-dont-pause, when set to t, will cause Emacs to fully redraw the display before it processes queued input events. This may have slight performance implications if you’re aggressively mouse scrolling a document or rely on your keyboard’s auto repeat feature. For most of us, myself included, it’s probably a no-brainer to switch it on.
;;  - Source: https://www.masteringemacs.org/article/improving-performance-emacs-display-engine
(setq redisplay-dont-pause t)

;; -- Looks --

(set-frame-font "JetBrains Mono 11" nil t)

(use-package nordic-night-theme
  :ensure t

;;  :config
;;  (load-theme 'nordic-night t)
)

(use-package naysayer-theme
  :ensure t

   :config
   (load-theme 'naysayer t)
)

(use-package catppuccin-theme
  :ensure t

  ;; :config
  ;; (load-theme 'catppuccin t)
)

;; (use-package vscode-dark-plus-theme
;;   :ensure t
;;   :config
;;   (load-theme 'vscode-dark-plus t)
;; )

;; Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq-default show-trailing-whitespace t)
(put 'upcase-region 'disabled nil)
