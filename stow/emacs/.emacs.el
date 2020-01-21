;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(ido-mode t)
(global-hl-line-mode t)
(global-linum-mode t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(font . "Iosevka-12:medium"))
(set-face-attribute 'default nil :font "Iosevka-12" )
(set-frame-font "Iosevka-12" nil t)

(setq-default line-spacing 8)
(setq-default cursor-type 'box)
(setq vc-follow-symlinks t)
(setq linum-format (quote "%4d "))

(setq whitespace-style (quote (tabs trailing newline tab-mark newline-mark)))
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
    (space-mark 32 [183] [46])
    (newline-mark 10 [172 10])
    (tab-mark 9 [9656 9] [92 9])
    ))
(global-whitespace-mode t)
(set-face-attribute 'whitespace-newline nil
                    :background nil
                    :foreground "DimGrey")
(electric-pair-mode t)

;; Global configuration
(setq make-backup-files nil)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
(setq typescript-indent-level 2)
(setq scss-indent-level 2)
(setq css-indent-offset 2)
(setq sh-basic-offset 2)
(setq inhibit-startup-message t)
(setq inhibit-splash-screen t)
(setq initial-major-mode 'org-mode)
(setq initial-scratch-message nil)
(setq auto-save-default nil)
(setq-default fill-column 80)
(setq create-lockfiles nil)
(setq ido-enable-flex-matching t)
(setq mmm-submode-decoration-level 0)
(setq markdown-open-command "/usr/bin/pandoc")
(setq mocha-snippets-use-fat-arrows t)
(setq x-select-enable-clipboard t)
(global-prettify-symbols-mode 0)

;; Package management
(require 'package)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; Activate installed packages
(package-initialize)

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; Vim mode
(use-package evil
  :init
  (setq-default evil-normal-state-cursor 'box)
  (setq-default evil-want-C-u-scroll t)
  (setq-default evil-shift-width 2)
  :config
  (evil-mode 1))

(use-package diminish
  :config
  (diminish 'undo-tree-mode)
  (diminish 'eldoc-mode)
  (diminish 'auto-revert-mode)
  (diminish 'global-whitespace-mode))

(use-package evil-surround
  :config
  (global-evil-surround-mode t))

;; Theme
(use-package gruvbox-theme
  :config
  (load-theme 'gruvbox t))

(use-package fill-column-indicator
  :init
  (setq fci-rule-column 81)
  (setq fci-rule-color "#444")
  :config
  (fci-mode 1))

(use-package ivy
  :diminish ivy-mode
  :init
  (setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
  :config
  (ivy-mode 1))

(use-package magit)

(use-package diff-hl
  :config
  (global-diff-hl-mode 1))

(use-package counsel)

(use-package flx)

(use-package rg
  :config
  (rg-enable-default-bindings))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package rainbow-mode
  :config
  (rainbow-mode 1))

(use-package markdown-mode
  :init
  (setq markdown-fontify-code-blocks-natively t))

(use-package olivetti
  :diminish olivetti-mode
  :config
  (olivetti-set-width 84)
  :hook
  (org-mode . olivetti-mode)
  (markdown-mode . olivetti-mode))

(use-package js2-mode
  :mode "\\.js\\'"
  :init
  (setq-default js2-global-externs
                '("module"
                  "exports"
                  "require"
                  "process"
                  "setTimeout"
                  "clearTimeout"
                  "setInterval"
                  "clearInterval"
                  "window"
                  "location"
                  "__dirname"
                  "console"
                  "JSON"
                  "before"
                  "beforeEach"
                  "after"
                  "afterEach"
                  "describe"
                  "it"
                  "expect"
                  "fetch")))

(use-package general
  :config (general-define-key
	   :states '(normal)
	   :prefix ","
     "a" 'counsel-rg
     "b" 'ivy-switch-buffer
	   "d" 'kill-this-buffer
	   "gbb" 'magit-blame
	   "gbq" 'magit-blame-quit
	   "gs" 'magit-status
     "h" 'ivy-resume
     "t" 'counsel-git
	   "w" 'save-buffer
	   "x" 'execute-extended-command
     "=" (lambda() (interactive) (find-file "~/.emacs.el"))
	   "SPC" 'evil-switch-to-windows-last-buffer))

(use-package projectile
  :diminish projectile-mode
  :config
  (projectile-global-mode t)
  (add-to-list 'projectile-globally-ignored-directories "node_modules")
  (add-to-list 'projectile-globally-ignored-directories "spec/cassettes")
  (add-to-list 'projectile-globally-ignored-file-suffixes ".map"))

(use-package org-bullets
  :config
  (org-bullets-mode t))

(use-package powerline
  :config
  (powerline-default-theme))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (diminish hlinum :hlinum diff-hl rainbow-delimiters rainbow-mode rg flx counsel magit general fill-column-indicator use-package gruvbox-theme evil))))
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
