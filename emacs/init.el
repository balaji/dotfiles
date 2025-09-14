(if (eq system-type 'darwin)
    ;;; mac osx
    (progn
      (setq projects-path '("~/projects"))
      (setq my-font "Source Code Pro 13")
      (load-file "~/projects/dotfiles/emacs/package-manager/elpaca.el")
      )
  (if (eq system-type 'gnu/linux)
      (progn
	      (setq projects-path '("~/projects"))
              (setq my-font "Source Code Pro Medium 14")
        (load-file "~/projects/dotfiles/emacs/package-manager/elpaca.el")
	)
    ;;; windows
    (progn
      (setq projects-path '("~/projects"))
      (setq my-font "Source Code Pro Medium 11")
      (load-file "~/projects/dotfiles/emacs/package-manager/elpaca.el")
      )))
(use-package better-defaults :ensure t)

(add-to-list 'load-path "~/projects/dotfiles/emacs/modules/")
;; (use-package vim-tab-bar)
(use-package emacs
  :custom
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)

  :init
  (setq read-process-output-max (* 1024 1024)) ;; 1mb
  (setq gc-cons-threshold 100000000)
  (setq inhibit-startup-screen 1)
  (setq initial-scratch-message "")
  (setq vc-follow-symlinks t)
  (setq auto-save-visited-mode t)
  (setq tab-width 4)
  (auto-save-visited-mode +1)
  (cua-mode t)
  (desktop-save-mode t)
  (recentf-mode t)
  (global-display-line-numbers-mode t)
  ;; (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  (add-hook 'prog-mode-hook 'flymake-mode)
  (add-hook 'text-mode-hook
            (lambda ()
              ;; (variable-pitch-mode 1)
              (visual-line-mode 1)
              (display-line-numbers-mode -1)))
  (defun my/on-window-display ()
    (if (display-graphic-p)
        (progn
          (set-frame-font my-font nil t)
          ;; (vim-tab-bar-mode 1)
          )
      ;; (progn
      ;;   (vim-tab-bar-mode 0))
      ))

  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (select-frame frame)
              (my/on-window-display)))
  (add-hook 'after-init-hook #'my/on-window-display)

  :bind
  (("M-p" . yank-from-kill-ring)
   ("C-c r" . xref-find-references)
   ("C-c d" . xref-find-definitions)
   ("<M-left>" . xref-go-back)
   ("<M-right>" . xref-go-forward)
   ))

(mapc 'load (file-expand-wildcards "~/projects/dotfiles/emacs/load/*.el"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
