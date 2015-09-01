;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; ESCHMAX 1.0
;;; Bare bones emacs config for beginners
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Enable MELPA (type M-x list-packages for a text-based package manager)
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;;; Remove bling (no toolbars/scrollbars/startup message)
(blink-cursor-mode 0)
(setq ring-bell-function 'ignore)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)

;;; Put backup files in tmp directory (instead of littering working directory)
(setq backup-directory-alist `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))
(setq auto-save-list-file-prefix temporary-file-directory)

;;; Don't prompt so much (saner way of prompting the user on file actions etc)
(fset 'yes-or-no-p 'y-or-n-p)
(setq confirm-nonexistent-file-or-buffer nil)
;; Don't ask to kill buffers with active processes
(setq kill-buffer-query-functions
  (remq 'process-kill-buffer-query-function
         kill-buffer-query-functions))

;;; Show some useful info in modeline
(display-time-mode t) ; this also shows cpu load
(line-number-mode t)
(column-number-mode t)

;;; Highlight matching start/end parenthesis
(show-paren-mode t)
