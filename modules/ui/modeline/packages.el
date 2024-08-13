;; -*- no-byte-compile: t; -*-
;;; ui/modeline/packages.el

<<<<<<< dest:   25da737c3d03 - git: feat(lib): doom-org-docs-mode: bind q to ...
(unless (or (modulep! +light) (modulep! +simple))
  (package! doom-modeline :pin "9920ef511620e9fa5599cb357e48487f758b1bb1"))
(when (modulep! +simple)
  (package! awesome-tray :recipe (:host github :repo "manateelazycat/awesome-tray")))
(package! anzu :pin "26fb50b429ee968eb944b0615dd0aed1dd66172c")
(when (modulep! :editor evil)
  (package! evil-anzu :pin "d1e98ee6976437164627542909a25c6946497899"))
