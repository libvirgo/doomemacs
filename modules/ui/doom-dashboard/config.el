;;; ui/doom-dashboard/config.el -*- lexical-binding: t; -*-

(use-package dashboard
  :unless (modulep! +simple)
  :custom
  (dashboard-display-icons-p t)     ; display icons on both GUI and terminal
  (dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
  (dashboard-set-heading-icons t)
  ;; (setq dashboard-set-heading-icons t)
  (dashboard-items '((recents   . 5)                        
                     (projects  . 5)
                     (bookmarks . 5)
                     (registers . 5)
                     (agenda    . 5)))
  (dashboard-item-shortcuts '((recents   . "r")
                              (bookmarks . "m")
                              (projects  . "p")
                              (agenda    . "a")
                              (registers . "e")))
  :config
  (dashboard-setup-startup-hook))

(when (modulep! +simple)
  (load! "+simple"))
