(load-file "~/projects/dotfiles/emacs/package-manager/elpaca.el") 

(if (eq system-type 'darwin)
    ;;; mac osx
    (progn
      (setq projects-path '("~/projects" "~/stripe"))
      )
  (if (eq system-type 'gnu/linux)
      ;;; linux
      (progn
	(setq projects-path '("~/projects"))
	(setq erlang-home "/usr/local/lib/erlang")
	)
    ;;; windows
    (progn
      (setq lsp-erlang-ls-server-path "c:/users/balaj/bin/erlang_ls.cmd")
      (setq projects-path '("~/projects"))
      )))
(use-package better-defaults :ensure t)

(add-to-list 'load-path "~/projects/dotfiles/emacs/modules/")
(add-to-list 'load-path (format "%s%s" erlang-home "/lib/tools-4.1/emacs"))
(use-package vim-tab-bar)
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
  (setq vc-follow-symlinks t)
  (setq auto-save-visited-mode t)
  (auto-save-visited-mode +1)
  (cua-mode t)
  (recentf-mode t)
  (global-display-line-numbers-mode t)
  (add-to-list 'default-frame-alist '(fullscreen . maximized))
  (setq minibuffer-prompt-properties
        '(read-only t cursor-intangible t face minibuffer-prompt))
  (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
  (add-hook 'text-mode-hook
            (lambda ()
              ;; (variable-pitch-mode 1)
              (visual-line-mode 1)
              (display-line-numbers-mode -1)))
  (defun my/on-window-display ()
    (if (display-graphic-p)
        (progn
          (set-frame-font "Cascadia Code 11" nil t)
          (vim-tab-bar-mode 1)
          )
      (progn
        (vim-tab-bar-mode 0)
	)))

  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (select-frame frame)
              (my/on-window-display)))
  (add-hook 'after-init-hook #'my/on-window-display))

(mapc 'load (file-expand-wildcards "~/projects/dotfiles/emacs/load/*.el"))
