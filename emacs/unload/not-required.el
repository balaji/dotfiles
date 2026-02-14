
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

(use-package bazel :ensure t)

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

;; required for treemacs
(use-package hydra
  :ensure t)

(use-package compat :ensure t)
