;; -- IMPORTANT NOTES (Should start using org-mode to keep track of these at some point. Don't know how convinient that would be really... I'm not a heavy emacs user so...) --

;; - Terminal and shell setup notes; Just a reminder that has nothing to do with emacs.
;; I use the windows terminal with cmd as the default prompt(The one that comes runs vcvarsXX.bat at the startup, "Developer Command Prompt for VS 2022" I believe) and clink with "clink.default_bindings" set to "bash" so i can use the emacs key bindings within cmd.
;; I also like to modify the "Starting directory" to whatever my current workspace directory is, in the profile of the previously said "dev blah blah prompt".

;; Always remember to run "runemacs --daemon" at the startup of your machine to speed up startup a bit.
;; Tutorial for Windows: Win+R, to open run menu, then type and run "shell:startup", finally create a shortcut that runs the emacs daemon(using "runemacs --daemon" as executable line or what ever the hell is called for the shortcut).

;; Defining %HOME% as a user environment variable is also a pretty good idea so emacs thinks ~/ is the user directory on windows. In emacs "~" or home is set to %APPDATA% by default on windows.

;; -- package.el Initialization --

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; -- Cool Stuff --

(setq ido-everywhere t)
(setq ido-enable-flex-matching t)

(ido-mode t)

(global-auto-revert-mode)

;; -- Indentation --

(defun style-c-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))

(add-hook 'c++-mode-hook 'style-c-mode-hook)
(add-hook 'c-mode-hook 'style-c-mode-hook)

(setq-default indent-tabs-mode nil)

;; -- Bullshit Removal --

(tool-bar-mode -1)
(menu-bar-mode -1)

;; I hate the emacs startup screen, looks stupid.
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

(set-face-attribute 'default nil :family "JetBrains Mono" :height 105)

(use-package nordic-night-theme
  :ensure t

  :config
  (load-theme 'nordic-night t))

;; Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq-default show-trailing-whitespace t)
