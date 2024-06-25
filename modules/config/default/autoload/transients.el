;;;###autoload (autoload '+transient/window "config/default/autoload/transients" nil t)
(transient-define-prefix +transient/window ()
  [
   ["Window resize:"
    ("<" "shrink horizontally" (lambda ()
                                 (interactive)
                                 (shrink-window-horizontally 5)) :transient t)
    (">" "enlarge horizontally" (lambda ()
                                  (interactive)
                                  (enlarge-window-horizontally 5)) :transient t)
    ("w" "shrink" (lambda ()
                    (interactive)
                    (shrink-window 5)) :transient t)
    ("s" "enlarge" (lambda ()
                     (interactive)
                     (enlarge-window 5)) :transient t)
    ("=" "balance" (lambda ()
                     (interactive)
                     (balance-windows)) :transient t)
    ]
   ["Window move:"
    ("h" "move left" windmove-swap-states-left)
    ("l" "move right" windmove-swap-states-right)
    ("j" "move down" windmove-swap-states-down)
    ("k" "move up" windmove-swap-states-up)
    ]
   ["Winner: [u]ndo [r]edo"
    ("u" "undo" winner-undo :transient t)
    ("r" "redo" winner-redo :transient t)
    ]
   ]
  )

