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
   ("C-x h" . consult-recent-file)))

(use-package corfu
  :custom
  (corfu-auto t)
  :ensure t
  :bind
  (:map corfu-map ("SPC" . corfu-insert-separator))
  :init
  (global-corfu-mode))

(use-package modus-themes
  :ensure t)

(use-package doom-themes
  :ensure t
  :config (load-theme 'tsdh-dark t))

(use-package doom-modeline
  :ensure t
  )

(use-package company
  :ensure t
  :config
  (global-company-mode))

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

;; (use-package erlang)

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-fine-undo t)
  (setq evil-want-C-u-scroll t)
  (setq evil-undo-system 'undo-redo)
  :hook
  (evil-insert-state-entry . (lambda () (send-string-to-terminal "\033[5 q")))
  (evil-insert-state-exit . (lambda () (send-string-to-terminal "\033[2 q")))
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
  (global-set-key (kbd "M-w") 'er/expand-region)
  (global-set-key (kbd "M-W") 'er/contract-region))

(use-package find-file-in-project
  :ensure t
  :config
  (setq ffip-match-path-instead-of-filename t)
  (setq ffip-use-rust-fd t))

(use-package flycheck
  :ensure t
  :bind
  (("<f2>" . flycheck-list-errors))
  :init (global-flycheck-mode))

(use-package flycheck-rust
  :after (flycheck rust-mode)
  :ensure t
  :hook
  ('flycheck-mode . 'flycheck-rust-setup))

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
   "gg" 'perspective-map

   "tt" 'treemacs-add-and-display-current-project-exclusively
   "td" 'treemacs

   "na" 'org-agenda-list
   "nt" 'org-todo-list
   "ncc" 'org-capture
   "ncj" 'org-journal-new-entry
   "ncd" 'org-journal-new-date-entry
   "ncf" 'org-roam-node-find
   "nci" 'org-roam-node-insert

   "en" 'flycheck-next-error
   "ep" 'flycheck-previous-error

   "ff" 'find-file-in-project-by-selected
   "fr" 'consult-fd

   "ss" 'consult-ripgrep
   "so" 'consult-outline
   "sw" 'avy-goto-word-1
   "sl" 'avy-goto-line

   "pp" 'whaler
   "pr" 'whaler-populate-projects-directories)

  (general-create-definer leader-global :keymaps 'custom/prefix))

;; required for treemacs
(use-package hydra
  :ensure t)

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

(use-package lsp-ui
  :ensure t
  :after (lsp-mode))

(use-package pet
  :ensure t
  :config
  (add-hook 'python-base-mode-hook 'pet-mode -10))

(use-package lsp-pyright
  :ensure t
  :after (lsp-mode)
  :custom (lsp-pyright-langserver-command "pyright")
  :hook (python-base-mode . (lambda ()
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
  ((python-base-mode) . 'ruff-format-on-save-mode))

(use-package smartparens
  :ensure t
  :bind
  (("<f7>" . 'smartparens-mode)
   ("<C-right>" . 'sp-forward-slurp-sexp)
   ("<C-left>" . 'sp-forward-barf-sexp)
   ("<C-M-right>" . 'sp-backward-slurp-sexp)
   ("<C-M-left>" . 'sp-backward-barf-sexp)
   ("M-(" . 'sp-wrap-round)
   ("M-{" . 'sp-wrap-curly)
   ("C-M-<delete>" . 'sp-splice-sexp-killing-forward)
   ("C-M-<backspace>" . 'sp-splice-sexp-killing-backward)
   )
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
  :ensure t
  :bind
  (("C-`" . 'treemacs-select-window)))

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

;; (use-package vterm
;;   :ensure t
;;   :hook
;;   ('vterm-mode . (lambda ()
;;                    (display-line-numbers-mode -1))))

(defun run-in-vterm (command)
  "Insert text of current line in vterm and execute."
  (interactive)
  (require 'vterm)
  (eval-when-compile (require 'subr-x))
  (let ((buf (current-buffer)))
    (unless (get-buffer vterm-buffer-name)
      (vterm))
    (display-buffer vterm-buffer-name t)
    (switch-to-buffer-other-window vterm-buffer-name)
    (vterm--goto-line -1)
    (message command)
    (vterm-send-string command)
    (vterm-send-return)
    (switch-to-buffer-other-window buf)))

(use-package whaler
  :ensure t
  :config
  (setq whaler-directories-alist projects-path)
  (setq whaler-include-hidden-directories nil)
  (setq whaler-default-working-directory "~")
  (setq whaler-oneoff-directories-alist '("~/Nextcloud/notes"))
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

(use-package perspective
  :ensure t
  :bind
  ("C-x C-b" . persp-list-buffers)
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :init
  (persp-mode))

(use-package treemacs-perspective
  :after (treemacs perspective)
  :ensure t
  :config (treemacs-set-scope-type 'Perspectives))

;; (use-package copilot
;;   :ensure (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
;;   :bind (:map copilot-completion-map
;;               ("TAB" . 'copilot-accept-completion)
;;               ("<tab>" . 'copilot-accept-completion)))
