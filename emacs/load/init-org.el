(use-package org
  :config
  (add-to-list 'org-modules 'org-habit t)
  (setq
   ;; Edit settings
   org-startup-folded 'show2levels
   org-startup-align-all-tables t
   ;; org-startup-indented t
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
   org-agenda-current-time-string "◀── now ──────────────────────────────────"
  org-ellipsis "…")
  (set-face-attribute 'org-ellipsis nil :inherit 'default :box nil)
;; (set-face-attribute 'org-block nil            :foreground nil :inherit
;; 'fixed-pitch :height 0.85)
;; (set-face-attribute 'org-code nil             :inherit '(shadow fixed-pitch) :height 0.85)
;; (set-face-attribute 'org-indent nil           :inherit '(org-hide fixed-pitch) :height 0.85)
;; (set-face-attribute 'org-verbatim nil         :inherit '(shadow fixed-pitch) :height 0.85)
;; (set-face-attribute 'org-special-keyword nil  :inherit '(font-lock-comment-face
;; fixed-pitch))
;; (set-face-attribute 'org-meta-line nil        :inherit '(font-lock-comment-face fixed-pitch))
;; (set-face-attribute 'org-checkbox nil         :inherit 'fixed-pitch)
  )

(use-package org-roam
  :ensure t)

(use-package org-modern
  :ensure t
  :config
  (setq org-modern-star 'replace)
  (global-org-modern-mode))
