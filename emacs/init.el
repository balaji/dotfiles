(load-file "~/projects/dotfiles/emacs/package-manager/elpaca.el") 

(if (eq system-type 'darwin)
    ;;; mac osx
    (progn
      (setq projects-path '("~/projects"))
      (add-to-list 'load-path "/opt/homebrew/lib/erlang/lib/tools-4.1.1/emacs")
      (setq my-font "Monaco 14")
      )
  (if (eq system-type 'gnu/linux)
      ;;; linux
      (progn
	(setq projects-path '("~/projects"))
	(add-to-list 'load-path "/usr/lib64/erlang/lib/tools-3.6/emacs")
        (setq my-font "Source Code Pro 11")
	)
    ;;; windows
    (progn
      (setq lsp-erlang-ls-server-path "c:/users/balaj/bin/erlang_ls.cmd")
      (add-to-list 'load-path "c:/users/balaj/scoop/apps/erlang/current/lib/tools-4.1.1/emacs")
      (setq projects-path '("~/projects"))
      (setq my-font "Consolas 11")
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
          (set-frame-font my-font nil t)
          ;; (vim-tab-bar-mode 1)
          )
      ;; (progn
      ;;   (vim-tab-bar-mode 0)
      ;;   )
      ))

  (add-hook 'after-make-frame-functions
            (lambda (frame)
              (select-frame frame)
              (my/on-window-display)))
  (add-hook 'after-init-hook #'my/on-window-display)
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . tsx-ts-mode))

  :bind
  (("M-p" . yank-from-kill-ring)))

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-log-io nil
        lsp-enable-file-watchers nil
        lsp-file-watch-threshold 6000
        lsp-disabled-clients '(semgrep-ls ruff)
        )
  :bind
  (("C-c r" . xref-find-references)
   ("C-c d" . xref-find-definitions)
   ("<M-left>" . xref-go-back)
   ("<M-right>" . xref-go-forward))
  :commands  (lsp lsp-deferred)
  :hook
  ((rust-ts-mode python-ts-mode ruby-ts-mode typescript-ts-mode js-ts-mode) . 'lsp-deferred))

(mapc 'load (file-expand-wildcards "~/projects/dotfiles/emacs/load/*.el"))
