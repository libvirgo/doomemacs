;;; ui/doom/config.el -*- lexical-binding: t; -*-

;;;###package pos-tip
(setq pos-tip-internal-border-width 6
      pos-tip-border-width 1)


(use-package! doom-themes
  ;; improve integration w/ org-mode
  :hook (doom-load-theme . doom-themes-org-config)
  :init 
  (when (and (modulep! :os macos) (modulep! +auto))
    (defun my/load-theme (appearance)
      "Load theme, taking current system APPEARANCE into consideration."
      (mapc #'disable-theme custom-enabled-themes)
      (pcase appearance
        ('light (load-theme doom-theme-light t))
        ('dark (load-theme doom-theme-dark t))))
    (add-hook 'ns-system-appearance-change-functions #'my/load-theme))
  (when (not (modulep! +auto))
    (if doom-theme-light
        (load-theme doom-theme-light t)
      (load-theme doom-theme-dark t)))
  ;; (setq doom-theme 'doom-one)
  ;; more Atom-esque file icons for neotree/treemacs
  ;; (when (modulep! :ui neotree)
  ;;   (add-hook 'doom-load-theme-hook #'doom-themes-neotree-config)
  ;;   (setq doom-themes-neotree-enable-variable-pitch t
  ;;         doom-themes-neotree-file-icons 'simple
  ;;         doom-themes-neotree-line-spacing 2))
  )

(use-package! circadian
  :when (and (not (modulep! :os macos)) (modulep! +auto))
  :hook (doom-after-init . circadian-setup)
  :config
  (setq circadian-themes `((:sunrise . ,doom-theme-light)
                           (:sunset . ,doom-theme-dark)))
  )

(use-package! solaire-mode
  :hook (doom-load-theme . solaire-global-mode)
  :hook (+popup-buffer-mode . turn-on-solaire-mode))
