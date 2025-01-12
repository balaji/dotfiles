(use-package org
  :ensure t
  :hook
  (org-mode . visual-line-mode)
  :config
  (setq
   ;; Edit settings
   org-startup-folded 'show2levels
   org-startup-align-all-tables t
   org-startup-indented t
   org-auto-align-tags nil
   org-tags-column 0
   org-fold-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t

   org-directory "~/projects/journal"
   org-default-notes-file (concat org-directory "/notes.org")
   org-agenda-files (list org-directory)
   org-duration-format (quote h:mm)

   ;; Org styling, hide markup etc.
   org-hide-emphasis-markers t
   org-pretty-entities t

   ;; Agenda styling
   org-agenda-tags-column 0
   org-agenda-block-separator ?─
   org-agenda-time-grid
   '((daily today require-timed)
     (800 1000 1200 1400 1600 1800 2000)
     " ┄┄┄┄┄ " "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
   org-agenda-current-time-string
   "◀── now ──────────────────────────────────")

  ;; Ellipsis styling
  (setq org-ellipsis "…")
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)
  )

(use-package org-roam
  :ensure t)

(use-package org-modern
  :ensure t
  :config
  (setq org-modern-star 'replace)
  (global-org-modern-mode))
