;;;
;; Package Manager
;;;;
(require 'package)
(defvar my-packages '(better-defaults
                      projectile
                      ag
                      helm
                      helm-projectile
                      helm-ag
                      company
                      rainbow-delimiters
                      paredit
                      markdown-mode
                      ace-window
                      flycheck
		      magit
		      cider
		      monokai-theme
		      ))

(add-to-list 'package-archives
             '("melpa". "https://melpa.org/packages/")
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (package my-packages)
  (unless (package-installed-p package)
    (package-install package)))


(require 'cc-mode)
(condition-case nil
    (require 'use-package)
  (file-error
   (require 'package)
   (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
   (package-initialize)
   (package-refresh-contents)
   (package-install 'use-package)
   (require 'use-package)))

(use-package projectile :ensure t)
(use-package yasnippet :ensure t)
(use-package lsp-mode :ensure t)
(use-package hydra :ensure t)
(use-package company-lsp :ensure t)
(use-package lsp-ui :ensure t)
(use-package lsp-java :ensure t :after lsp
  :config (add-hook 'java-mode-hook 'lsp))

(use-package dap-mode
  :ensure t :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package dap-java :after (lsp-java))

;;;;
;; Helm
;;;;
(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)
(setq helm-buffers-fuzzy-matching t
      helm-apropos-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-recentf-fuzzy-match t)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-c h o") 'helm-occur)
(global-set-key (kbd "C-c r b") 'helm-filtered-bookmarks)

;;;;
;; Projectile
;;;;
(require 'projectile)
(require 'helm-projectile)
(projectile-mode t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(global-set-key (kbd "C-x g") 'helm-projectile-grep)
(global-set-key (kbd "C-x f") 'helm-projectile-find-file)

;;;;
;; Ace Window
;;;;
(global-set-key (kbd "C-x o") 'ace-window)

;; loads theme only for GUI and default theme for TTY
(defun my-load-theme (theme)
  (add-hook 'after-make-frame-functions
	    `(lambda (frame)
	       (select-frame frame)
	       (if (display-graphic-p frame)
		   (load-theme ',theme t)
		 (disable-theme ',theme)))))

;;(my-load-theme 'solarized-dark)

;;;;
;; Lisp misc
;;;;
(require 'paredit)
(require 'rainbow-delimiters)
(require 'flycheck)
(setq-default flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(global-flycheck-mode)
(tool-bar-mode 0)
(menu-bar-mode 0)
(global-set-key [f7] 'paredit-mode)
(load-theme 'monokai t)
(setq backup-directory-alist `(("." . "~/.saves"))
      delete-old-versions t
      version-control t)

;;rainbow delimiters everywhere
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(setq ispell-program-name "/usr/local/bin/ispell"
      inferior-lisp-program "/usr/local/acl10.1express/alisp"
      slime-contribs '(slime-fancy))
(require 'company) ;;complete anything
(add-hook 'after-init-hook 'global-company-mode)
;; editor stuff.
(setq vc-follow-symlinks t)
(global-linum-mode t)
(setq linum-format "%4d \u2502 ")
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)

;;org-mode
(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)

(setq org-directory "~/Dropbox/Personal"
      org-default-notes-file (concat org-directory "/inbox.org"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Hack" :foundry "SRC" :slant normal :weight normal :height 110 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "d91ef4e714f05fff2070da7ca452980999f5361209e679ee988e3c432df24347" "0598c6a29e13e7112cfbc2f523e31927ab7dce56ebb2016b567e1eff6dc1fd4f" default)))
 '(package-selected-packages
   (quote
    (dap-mode lsp-ui company-lsp use-package yasnippet lsp-javacomp treemacs lsp-java monokai-theme cider magit slime solarized-theme rainbow-delimiters paredit markdown-mode helm-projectile helm-ag flycheck company better-defaults ag ace-window))))
