;; -*- no-byte-compile: t; -*-
;;; ui/doom/packages.el
(when (modulep! +ef-themes)
  (package! ef-themes :pin "5e902f286bc052bcc200826d0677bd17f8f21b12")
  )
(package! doom-themes :pin "2c794a09b023bda09d2f36a7be80684f4e416d88")
(package! solaire-mode :pin "c9334666bd208f3322e6118d30eba1b2438e2bb9")
(when (and (not (modulep! :os macos)) (modulep! +auto))
  (package! circadian :pin "76464419f69e9758bc5a76b2420c9648ddf93dba")
  )
