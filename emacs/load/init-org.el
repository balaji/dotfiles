(use-package org
  :config
  (add-to-list 'org-modules 'org-habit t)
  (setq
   org-startup-folded 'show2levels
   org-startup-align-all-tables t
   org-startup-indented t
   org-auto-align-tags nil
   org-tags-column 0
   org-fold-catch-invisible-edits 'show-and-error
   org-special-ctrl-a/e t
   org-insert-heading-respect-content t
   org-directory "~/Dropbox/journal"
   org-default-notes-file (concat org-directory "/notes.org")
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
   org-agenda-current-time-string "◀── now ──────────────────────────────────"
   org-ellipsis "…"
   org-agenda-files (list "notes.org"))
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)
  :hook
  ('org-mode . (lambda() (smartparens-mode -1))))

;; (use-package org-roam
;;   :ensure t
;;   :after (org org-roam-dailies vulpea)
;;   :config
;;   (setq org-roam-node-display-template (concat "${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
;;   (setq org-roam-completion-everywhere t)
;;   (org-roam-db-autosync-mode)
;;   (require 'org-roam-protocol))

;; (use-package org-roam-ui
;;   :after (org-roam)
;;   :ensure t)

(use-package org-journal
  :ensure t
  :custom
  (org-journal-date-prefix "#+title: ")
  (org-journal-file-format "%Y-%m-%d.org")
  (org-journal-dir (concat org-directory "/daily"))
  (org-journal-date-format "%A, %d %B %Y"))

(use-package org-modern
  :ensure t
  :after (org)
  :config
  (setq org-modern-star 'replace)
  (global-org-modern-mode))
