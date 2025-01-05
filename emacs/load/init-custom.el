(defun new-post(blog-name)
  "Creates a new microblog entry for my blog in balaji.dev"
  (interactive "sBlog-name:")
  (let ((prefix (format-time-string "%Y-%m-%d-" (current-time))))
    (with-temp-buffer (write-file (concat "~/projects/balaji.github.io/_posts/" prefix blog-name ".md")))))

