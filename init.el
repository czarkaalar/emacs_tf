(setq straight-use-package-by-default t) ;; have use-package use straight.el by default.

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package) ;; install use-package via straight

(use-package all-the-icons)
(use-package all-the-icons-dired
  :hook
  (dired-mode . all-the-icons-dired-mode))
(use-package dired
  :straight (:type built-in)
  :hook
  (dired-mode . dired-hide-details-mode)
  )
(dired ".")

(use-package electric
  :straight (:type built-in)
  :init

  (electric-pair-mode +1
		      )
  (setq electric-pair-preserve-balance nil)
  )

;;*Languages
;; TODO: fix tsx
(use-package htmlize)
(use-package js2-mode)
;; (use-package typescript-mode)
;; (use-package tide
;;   :ensure t
;;   :after (typescript-mode company flycheck)
;;   :hook ((typescript-mode . tide-setup)
;;          (typescript-mode . tide-hl-identifier-mode)
;;          (before-save . tide-format-before-save)))
(straight-use-package 'tree-sitter)
(straight-use-package 'tree-sitter-langs)
(straight-use-package '(tsi :type git :host github :repo "orzechowskid/tsi.el"))

;; see the world burn
(use-package vscode-dark-plus-theme
  :ensure t
  :config
  (load-theme 'vscode-dark-plus t))
