;; -- IMPORTANT NOTES (Should start using org-mode to keep track of these at some point. Don't know how convinient that would be really... I'm not a heavy emacs user so...) --

;; - Terminal and shell setup notes; Just a reminder that has nothing to do with emacs.
;; I use the windows terminal with cmd as the default prompt(The one that comes runs vcvarsXX.bat at the startup, "Developer Command Prompt for VS 2022" I believe) and clink with "clink.default_bindings" set to "bash" so i can use the emacs key bindings within cmd.
;; I also like to modify the "Starting directory" to whatever my current workspace directory is, in the profile of the previously said "dev blah blah prompt".

;; Defining %HOME% as a user environment variable is also a pretty good idea so emacs thinks ~/ is the user directory on windows. In emacs "~" or home is set to %APPDATA% by default on windows.

;; @Note: I don't really use packages

;; @Todo: Do clean-up and organizaition.
;; -- Key bindings --
(global-set-key (kbd "M-p") (kbd "C-<up>"))
(global-set-key (kbd "M-n") (kbd "C-<down>"))

(global-set-key (kbd "M-<return>") #'recompile)
(global-set-key (kbd "C-<return>") #'compile)

(defun open-init-file ()
  (interactive)
  (find-file user-init-file))

(global-set-key (kbd "C-:") #'open-init-file)

;; -- Cool Stuff --

;; Non vcs-staged file with (mostly) personal stuff in it.
(setq local-stuff-file (concat user-emacs-directory "local-stuff.el"))
(when (file-exists-p local-stuff-file)
  (load local-stuff-file))

(global-auto-revert-mode)

;; -- Code Style and language specific helpers --

;; C/C++ Style and custom keywords

(defvar our-c-custom-keywords '("internal" "defer" "global_var" "cast"))

(defun the-c-mode-hook ()
  (dolist (keyword our-c-custom-keywords)
    (font-lock-add-keywords
     nil
     `((,(concat "\\<" keyword "\\>") . 'font-lock-keyword-face)))

    ;; NOTE: This prevents the keyword from being fontified with font-lock-type-face when located in front of declarations.
    ;;       P.S: It took me like six hours to figure this stupid shit out (not a fucking joke)...
    (push keyword c-noise-macro-with-parens-names))

  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))

(add-hook 'c++-mode-hook 'the-c-mode-hook)
(add-hook 'c-mode-hook 'the-c-mode-hook)

(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; -- Bullshit Removal --

(setq special-display-buffer-names
      '("*compilation*"))

;; @Fix: This doesn't work as intended!
(defun compilation-custom-split-window ()
  (if (< (length (window-list)) 2)
      (progn (split-window-horizontally)
             (other-window 1))
    (split-window)))

(setq special-display-function
      (lambda (buffer &optional args)
        (compilation-custom-split-window)
        (switch-to-buffer buffer)
        (get-buffer-window buffer 0)))

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; I hate the emacs startup screen, it looks stupid.
(setq inhibit-startup-screen t)

;; Not working properly btw!
(setq create-lockfiles nil)
(setq backup-directory-alist
      `((".*" . "~/.emacs-saves")))
(setq auto-save-file-name-transform
      `((".*" . "~/.emacs-saves")))

(when (fboundp 'set-message-beep)
  (set-message-beep 'silent))

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

;; -- Performance --

;; The variable redisplay-dont-pause, when set to t, will cause Emacs to fully redraw the display before it processes queued input events. This may have slight performance implications if you’re aggressively mouse scrolling a document or rely on your keyboard’s auto repeat feature. For most of us, myself included, it’s probably a no-brainer to switch it on.
;;  - Source: https://www.masteringemacs.org/article/improving-performance-emacs-display-engine
(setq redisplay-dont-pause t)

(setq native-comp-speed 2)

;; -- Looks --
(setq-default truncate-lines 't)
(setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist)) ;; Disables the truncation marker.

(when (not (boundp 'current-font))
  (setq current-font "JetBrains Mono Semibold-12"))

;;(set-frame-font current-font nil t)
(add-to-list 'default-frame-alist `(font . ,current-font))

(defun set-theme (theme)
  (load-theme theme)
  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (with-selected-frame frame
                (load-theme theme t)))))

(load (expand-file-name "nordic-night-theme/nordic-night-theme.el" user-emacs-directory))
(set-theme 'nordic-night)

;; Line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq-default show-trailing-whitespace t)
(put 'upcase-region 'disabled nil)
