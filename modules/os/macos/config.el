;;; os/macos/config.el -*- lexical-binding: t; -*-

;;
;;; Reasonable defaults for macOS

;; Use spotlight search backend as a default for M-x locate (and helm/ivy
;; variants thereof), since it requires no additional setup.
(setq locate-command "mdfind")

(setq dired-use-ls-dired nil)
;;
;;; Compatibilty fixes

;; Curse Lion and its sudden but inevitable fullscreen mode!
;; This is meaningless to railwaycat's emacs-mac build though.
(setq ns-use-native-fullscreen nil)

;; Visit files opened outside of Emacs in existing frame, not a new one
(setq ns-pop-up-frames nil)

;; Sane trackpad/mouse scroll settings. Also disables smooth scrolling because
;; it's disturbingly clunky and slow without something like
;; jdtsmith/ultra-scroll-mac.
(setq mac-redisplay-dont-reset-vscroll t
      mac-mouse-wheel-smooth-scroll nil)

;; Sets `ns-transparent-titlebar' and `ns-appearance' frame parameters so window
;; borders will match the enabled theme.
(and (or (daemonp)
         (display-graphic-p))
     (require 'ns-auto-titlebar nil t)
     (ns-auto-titlebar-mode +1))

;; Integrate with Keychain
(after! auth-source
  (pushnew! auth-sources 'macos-keychain-internet 'macos-keychain-generic))

;; Delete files to trash on macOS, as an extra layer of precaution against
;; accidentally deleting wanted files.
(setq delete-by-moving-to-trash (not noninteractive))


;; translate mac keyboard yen to backslash
(defcustom doom-keyboard-type nil
  "if doom-keyboard-type is jp, while translate mac keyboard yen to backslash"
  :group 'doom
  :type 'symbol)

(defun mac-translate-from-yen-to-backslash ()
  ;; Convert yen to backslash for JIS keyboard.
  (interactive)
  (when (eq doom-keyboard-type 'jp)
    (define-key global-map [165] nil)
    (define-key global-map [2213] nil)
    (define-key global-map [3420] nil)
    (define-key global-map [67109029] nil)
    (define-key global-map [67111077] nil)
    (define-key global-map [8388773] nil)
    (define-key global-map [134219941] nil)
    (define-key global-map [75497596] nil)
    (define-key global-map [201328805] nil)
    (define-key function-key-map [165] [?\\])
    (define-key function-key-map [2213] [?\\]) ;; for Intel
    (define-key function-key-map [3420] [?\\]) ;; for PowerPC
    (define-key function-key-map [67109029] [?\C-\\])
    (define-key function-key-map [67111077] [?\C-\\])
    (define-key function-key-map [8388773] [?\M-\\])
    (define-key function-key-map [134219941] [?\M-\\])
    (define-key function-key-map [75497596] [?\C-\M-\\])
    (define-key function-key-map [201328805] [?\C-\M-\\])))

(add-hook! 'doom-first-buffer-hook #'mac-translate-from-yen-to-backslash)

;; (defvar using-trackpad-timer nil)
;; (defvar using-trackpad nil)

;; (defun mouse-present-p ()
;;   (with-temp-buffer
;;     (call-process "ioreg" nil (current-buffer) nil "-p" "IOUSB")
;;     (goto-char (point-min))
;;     (and (search-forward "USB Receiver" nil t) t)))

;; (defun set-using-trackpad ()
;;   (setq using-trackpad (not (mouse-present-p))))

;; (defun maybe-mouse-wheel-text-scale (event)
;;   (interactive (list last-input-event))
;;   (when (not using-trackpad)
;;     (mouse-wheel-text-scale event)))

;; (when using-trackpad-timer
;;   (cancel-timer using-trackpad-timer))
;; (setq using-trackpad-timer (run-at-time "0" 60 'set-using-trackpad))
(global-set-key [(control wheel-up)] nil)
(global-set-key [(control wheel-down)] nil)
