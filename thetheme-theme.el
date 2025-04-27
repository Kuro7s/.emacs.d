;;; thetheme-theme.el --- thetheme
;;; Version: 1.0
;;; Commentary:
;;; A theme called thetheme
;;; Code:

(deftheme thetheme "DOCSTRING for thetheme")
  (custom-theme-set-faces 'thetheme
   '(default ((t (:foreground "#eadec6" :background "#002424" ))))
   '(cursor ((t (:background "#fdf4c1" ))))
   '(fringe ((t (:background "#002525" ))))
   '(mode-line ((t (:foreground "#000000" :background "#f0ffe5" ))))
   '(region ((t (:background "#0051aa" ))))
   '(secondary-selection ((t (:background "#628687" ))))
   '(font-lock-builtin-face ((t (:foreground "#89ffa0" ))))
   '(font-lock-comment-face ((t (:foreground "#00c077" ))))
   '(font-lock-function-name-face ((t (:foreground "#ffffff" ))))
   '(font-lock-keyword-face ((t (:foreground "#ffffff" ))))
   '(font-lock-string-face ((t (:foreground "#00c278" ))))
   '(font-lock-type-face ((t (:foreground "#6fffa1" ))))
   '(font-lock-constant-face ((t (:foreground "#a0ffe5" ))))
   '(font-lock-variable-name-face ((t (:foreground "#cfe4e3" ))))
   '(minibuffer-prompt ((t (:foreground "#ebffdd" :bold t ))))
   '(font-lock-warning-face ((t (:foreground "red" :bold t ))))
   )

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'thetheme)

;;; thetheme-theme.el ends here
