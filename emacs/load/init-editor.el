(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  (setq aw-dispatch-always t)
  (ace-window-display-mode))

(use-package avy :ensure t)

(use-package bazel :ensure t)

(use-package cape
  :ensure t
  :bind ("C-c p" . cape-prefix-map))

(use-package consult
  :ensure t
  :bind
  (("C-x b" . consult-buffer)
   ("C-s" . consult-line)
   ("C-c r" . consult-recent-file)))

(use-package corfu
  :custom
  (corfu-auto t)
  :ensure t
  :bind
  (:map corfu-map ("SPC" . corfu-insert-separator))
  :init
  (global-corfu-mode))

(use-package doom-themes
  :ensure t
  :config (load-theme 'doom-gruvbox t))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode))

(use-package embark
  :ensure t
  :bind
  (("C-'" . embark-act)
   ("C-;" . embark-dwim)
   ("C-h b" . embark-bindings))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :ensure t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package erlang)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-fine-undo t)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-redo)
  :config
  (evil-mode t))

(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package exec-path-from-shell
  :ensure t
  :init
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region)
  (global-set-key (kbd "C--") 'er/contract-region))

(use-package find-file-in-project
  :ensure t
  :config
  (setq ffip-match-path-instead-of-filename t)
  (setq ffip-use-rust-fd t))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package general
  :ensure t
  :config
  (general-auto-unbind-keys)
  (general-define-key
   :states '(emacs insert normal)
   :prefix-map 'custom/prefix
   :global-prefix "C-c"
   :non-normal-prefix "M-SPC"
   :prefix "SPC"
   "fr" 'find-file-in-project-by-selected
   "ff" 'consult-fd
   "ss" 'consult-ripgrep
   "so" 'consult-outline
   "sw" 'avy-goto-word-1
   "sl" 'avy-goto-line
   "pp" 'whaler
   "wr" 'whaler-populate-projects-directories)

  (general-create-definer leader-global :keymaps 'custom/prefix))

;; required for treemacs
(use-package hydra
  :ensure t)

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((lsp-mode . lsp-enable-which-key-integration))
  :config
  (setq lsp-log-io nil
        lsp-enable-file-watchers nil
        lsp-file-watch-threshold 6000
        lsp-disabled-clients '(semgrep-ls ruff)
        )
  :commands  (lsp lsp-deferred))

(use-package lsp-ui
  :ensure t
  :after (lsp-mode))

(use-package lsp-pyright
  :ensure t
  :custom (lsp-pyright-langserver-command "pyright")
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred))))

(use-package magit :ensure t)

(use-package marginalia
  :ensure t
  :bind (:map minibuffer-local-map
              ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package markdown-mode :ensure t)

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package rainbow-delimiters
  :ensure t
  :hook
  ((prog-mode emacs-lisp-mode lisp-mode erlang-mode) . rainbow-delimiters-mode)
  :config
  (rainbow-delimiters-mode))

(use-package ruby-mode
  :config
  (defun my-ruby-mode-hook ()
    (set-fill-column 80)
    (add-hook 'before-save-hook 'delete-trailing-whitespace nil 'local)
    (setq ruby-insert-encoding-magic-comment nil))
  (add-hook 'ruby-mode-hook 'my-ruby-mode-hook))

(use-package rust-mode
  :init
  (setq rust-format-on-save t)
  :ensure t)

(use-package ruff-format
  :ensure t
  :hook
  ((python-mode) . 'ruff-format-on-save-mode))

(use-package smartparens
  :ensure t
  :bind
  ("<f7>" . 'smartparens-mode)
  :config
  (require 'smartparens-config)
  (smartparens-global-mode t))

(use-package solaire-mode
  :ensure t
  :config
  (solaire-global-mode +1))

;; required for magit
(use-package transient :ensure t)

(use-package treemacs
  :ensure t)

(use-package treemacs-evil
  :after (treemacs evil)
  :ensure t)

(use-package treemacs-magit
  :after (treemacs magit)
  :ensure t)

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :config
  (vertico-multiform-mode)
  (setq vertico-multiform-categories '((embark-keybinding grid)))
  :init
  (vertico-mode))

(use-package vterm
  :ensure t)

(use-package whaler
  :ensure t
  :config
  (setq whaler-directories-alist projects-path)
  (setq whaler-include-hidden-directories nil)
  (setq whaler-default-working-directory "~")
  (whaler-populate-projects-directories))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1)
  :hook
  ((markdown-mode) . (lambda () (set (make-local-variable 'yas-indent-line) 'fixed)))
  :config
  (setq yas-snippet-dirs
        (append yas-snippet-dirs '("~/projects/dotfiles/emacs/custom-snippets")))
  (yas-reload-all))

(use-package yasnippet-snippets
  :ensure t)
