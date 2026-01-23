;; -- WINDOWS IMPORTANT NOTES (Should start using org-mode to keep track of these at some point. Don't know how convinient that would be really...) -- (You damn microsoft...)

;; !!! FOR EMACS TO LOOK RIGHT EVEN IF YOU CHANGE SCREENS YOU NEED TO CHANGE DPI SETTINGS OF THE EMACS EXECUTABLE AND SET SCALING PERFORMED BY APPLICATION !!!

;; - Terminal and shell setup notes; Just a reminder that has nothing to do with emacs.
;; I use the windows terminal with cmd as the default prompt(The one that comes runs vcvarsXX.bat at the startup, "Developer Command Prompt for VS <VERSION>" I believe) and clink with "clink.default_bindings" set to "bash" so i can use the emacs key bindings within cmd.
;; I also like to modify the "Starting directory" to whatever my current workspace directory is, in the profile of the previously said "dev blah blah prompt".

;; Defining %HOME% as a user environment variable is also a pretty good idea so emacs thinks ~/ is the user directory on windows. In emacs "~" or home is set to %APPDATA% by default on windows.

;; @Todo: Do some organizaition.

;; -- Key bindings --
(global-set-key (kbd "M-p") (kbd "C-<up>"))
(global-set-key (kbd "M-n") (kbd "C-<down>"))

(global-set-key (kbd "C-{") (kbd "C-x {"))
(global-set-key (kbd "C-}") (kbd "C-x }"))

(global-set-key (kbd "M-<return>") #'recompile)
(global-set-key (kbd "C-<return>") #'compile)

(defun open-init-file ()
  (interactive)
  (find-file user-init-file))

(global-set-key (kbd "C-:") #'open-init-file)

;; -- Code Style and language specific helpers --

;; C/C++ Style and custom keywords

(defvar our-c-custom-keywords '("internal" "global_var" "local_persist" "defer"))

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

(add-hook 'c++-mode-hook #'the-c-mode-hook)
(add-hook 'c-mode-hook #'the-c-mode-hook)

(setq-default indent-tabs-mode nil)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; -- Other --

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

(setq inhibit-startup-screen t)

(setq create-lockfiles nil)
(setq backup-directory-alist
      `((".*" . ,(concat user-emacs-directory ".emacs-saves/"))))
(setq auto-save-file-name-transform
      `((".*" . ,(concat user-emacs-directory ".emacs-saves/"))))

(setq ring-bell-function 'ignore)

(setq custom-file (concat user-emacs-directory "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))

(setq completion-styles '(flex basic))

;; Maybe I should make this toggable.
;; (global-auto-revert-mode)

;; -- Performance --

;; The variable redisplay-dont-pause, when set to t, will cause Emacs to fully redraw the display before it processes queued input events. This may have slight performance implications if you’re aggressively mouse scrolling a document or rely on your keyboard’s auto repeat feature. For most of us, myself included, it’s probably a no-brainer to switch it on.
;;  - Source: https://www.masteringemacs.org/article/improving-performance-emacs-display-engine
(setq redisplay-dont-pause t)

(setq native-comp-speed 2)

;; -- Looks --
;; Line truncation
(setq-default truncate-lines t)
(setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist)) ;; Disables the truncation marker.

;; Line numbers, column numbers and trailing whitespace.
(column-number-mode 1)
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

(setq-default show-trailing-whitespace t)
(put 'upcase-region 'disabled nil)

;; Font and theme
(defun set-font (name)
  (set-frame-font name nil t)
  (add-to-list 'default-frame-alist `(font . ,name)))

;;(set-font "JetBrains Mono Semibold-12.5")
(set-font "Comic Mono-12.5")

(deftheme gruvbox-ish-theme "A gruvbox-ish theme for emacs. You could even say this is just gruvbox since as it uses the same palette")
  (custom-theme-set-faces 'gruvbox-ish-theme
   '(default ((t (:foreground "#ebdbb2" :background "#1c1c1c" ))))
   '(cursor ((t (:background "#ebdbb2" ))))
   '(fringe ((t (:background "#1c1c1c" ))))
   '(line-number ((t (:foreground "#7c6f64" :background "#1c1c1c" ))))
   '(line-number-current-line ((t (:foreground "#fabd2f" ))))
   '(mode-line ((t (:foreground "#ebdbb2" :background "#303030" ))))
   '(region ((t (:background "#504945" ))))
   '(secondary-selection ((t (:background "#3c3836" ))))
   '(font-lock-builtin-face ((t (:foreground "#8ec07c" ))))
   '(font-lock-comment-face ((t (:foreground "#7c6f64" ))))
   '(font-lock-function-name-face ((t (:foreground "#b8bb26" ))))
   '(font-lock-keyword-face ((t (:foreground "#fb4934" ))))
   '(font-lock-string-face ((t (:foreground "#b8bb26" ))))
   '(font-lock-type-face ((t (:foreground "#fabd2f" ))))
   '(font-lock-constant-face ((t (:foreground "#d3869b" ))))
   '(font-lock-variable-name-face ((t (:foreground "#83a598" ))))
   '(minibuffer-prompt ((t (:foreground "#b8bb26" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t )))))

(provide-theme 'gruvbox-ish-theme)
(enable-theme 'gruvbox-ish-theme)
