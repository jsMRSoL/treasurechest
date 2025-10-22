;;; sp-buffer-utils.el --- Buffer-processing utility functions  -*- lexical-binding: t -*-

(defun sp/find-regex-bounds (regex &optional start end)
  "Search for REGEX in the current buffer between START and END.
Return a cons cell (START . END) of the first match, or nil if not found."
  (save-excursion
    (goto-char (or start (point-min)))
    (when (re-search-forward regex end t)
      (cons (match-beginning 0) (match-end 0)))))

(defun sp/collect-arg-from-buffer (prefix)
  "Return the captured part of the first line starting with PREFIX, or nil."
  (save-excursion
    (goto-char (point-min))
    (when (re-search-forward (concat "^" (regexp-quote prefix) "\\s-*\\(.*\\)$") nil t)
      (match-string-no-properties 1))))

(provide 'sp-buffer-utils)
;;; sp-utils.el ends here
