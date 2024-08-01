;;; lang/protobuf/config.el -*- lexical-binding: t; -*-

(use-package! protobuf-mode
  :mode ("\\.proto$" . protobuf-mode)
  :config
  (defconst my-protobuf-style
    '((c-basic-offset . 2)
      (indent-tabs-mode . nil)))
  (add-hook 'protobuf-mode-hook
            (lambda () (c-add-style "my-style" my-protobuf-style t)))
  )
