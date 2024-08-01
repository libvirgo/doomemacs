;;; completion/copilot/config.el -*- lexical-binding: t; -*-

;; accept completion from copilot and fallback to company
(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ("C-f" . 'copilot-accept-completion)
              ("M-f" . 'copilot-accept-completion-by-word))
  :config
  (defadvice! +copilot--get-source-a (fn &rest args)
    :around #'copilot--get-source
    (cl-letf (((symbol-function #'warn) #'message))
      (apply fn args)))
  (setq lisp-indent-offset 2)
  (cl-loop for (mode . indent) in '((go-mode 4)
                                    (dart-mode 2)
                                    (prog-mode 2))
           do (add-to-list 'copilot-indentation-alist (cons mode indent))))
