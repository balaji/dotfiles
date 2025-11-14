;; -*- lexical-binding: t; -*-
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

(use-package company
  :ensure t
  :init
  (global-company-mode))

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox-dark-medium t)
  )

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode))

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

   "ww" 'ace-window

   "tt" 'treemacs-add-and-display-current-project-exclusively
   "td" 'treemacs

   "na" 'org-agenda-list
   "nt" 'org-todo-list
   "ncc" 'org-capture
   "ncj" 'org-journal-new-entry
   "ncf" 'org-roam-node-find
   "nci" 'org-roam-node-insert
   "ncd" 'org-journal-new-date-entry

   "en" 'flymake-goto-next-error
   "ep" 'flymake-goto-prev-error

   "fr" 'find-file-in-project-by-selected
   "ff" 'consult-fd

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

(use-package magit
  :ensure t)

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
  ((prog-mode emacs-lisp-mode lisp-mode) . rainbow-delimiters-mode)
  :config
  (rainbow-delimiters-mode))

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
(use-package transient
  :ensure t)

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

(if (not (eq system-type 'windows-nt))
    (use-package vterm
      :after popper
      :ensure t
      :custom
      (vterm--internal popper-display-function)
      :hook
      (vterm-mode . (lambda ()
                      (display-line-numbers-mode -1)))))

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
  (setq whaler-directories-alist '("~/projects"))
  (setq whaler-include-hidden-directories nil)
  (setq whaler-default-working-directory "~")
  (whaler-populate-projects-directories))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

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

(use-package popper
  :ensure t
  :bind (("C-`"   . popper-toggle)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type))
  :init
  (setq popper-reference-buffers
        '("\\*Messages\\*"
          "Output\\*$"
          "\\*Async Shell Command\\*"
          help-mode
          ;; vterm-mode
          inferior-python-mode
          compilation-mode))
  (popper-mode +1)
  (popper-echo-mode +1))

(use-package gptel :ensure t)

(use-package compat :ensure t)

;; -----------------
;; LSP
;; -----------------

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '(python-mode . ("ty" "server"))))

(use-package treesit-auto
  :ensure t
  :custom
  (treesit-auto-install 'prompt)
  :config
  (treesit-auto-add-to-auto-mode-alist 'all)
  (global-treesit-auto-mode))

;; -----------------
;; Rust
;; -----------------

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t))

;; -----------------
;; Python
;; -----------------
(use-package ruff-format
  :ensure t
  :hook
  ((python-base-mode) . 'ruff-format-on-save-mode))

(use-package flymake-ruff
  :ensure t
  :after (flymake)
  :hook ((python-ts-mode python-mode) . flymake-ruff-load))

(use-package pet
  :ensure t
  :config
  (add-hook 'python-base-mode-hook 'pet-mode -10))

(use-package dap-mode
  :ensure t)

(use-package dap-python
  :after dap-mode
  :init
  (setq dap-python-debugger 'debugpy))

(use-package fsharp-mode
  :ensure t)

(use-package eglot-fsharp :ensure t)
