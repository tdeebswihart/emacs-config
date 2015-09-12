(use-package evil-leader
  :commands global-evil-leader-mode
  :config
  (evil-leader/set-leader "<SPC>")
  (evil-leader/set-key
    "e" 'helm-find-files
    "b" 'helm-mini
    "s" 'swiper-helm
    "w" 'save-buffer
    "k" 'kill-buffer
    "f" 'helm-projectile-find-file
    "p" 'helm-projectile-switch-project)
  )

(use-package key-chord
  :commands key-chord-mode)
(use-package evil-surround
  :commands global-evil-surround-mode)
(use-package evil-matchit
  :commands global-evil-matchit-mode)
(use-package evil-nerd-commenter
  :commands (evilnc-default-hotkeys)
  :config
  (evil-leader/set-key
    "ci" 'evilnc-comment-or-uncomment-lines
    "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
    "ll" 'evilnc-quick-comment-or-uncomment-to-the-line
    "cc" 'evilnc-copy-and-comment-lines
    "cp" 'evilnc-comment-or-uncomment-paragraphs
    "cr" 'comment-or-uncomment-region
    "cv" 'evilnc-toggle-invert-comment-line-by-line
    "\\" 'evilnc-comment-operator ; if you prefer backslash key
    ))

(defun my-save-if-bufferfilename ()
  (if (buffer-file-name) (progn (save-buffer))
    (message "no file is associated to this buffer: do nothing")))

(use-package evil
  :commands evil-mode
  :config
  (add-hook 'evil-insert-state-exit-hook 'my-save-if-bufferfilename)
   ;;; esc quits
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)
  ;; Exit insert mode on jk
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (global-evil-surround-mode 1)
  (global-evil-matchit-mode 1)
  (evilnc-default-hotkeys)
  )
(global-evil-leader-mode)
(evil-mode 1)
(provide 'my-evil)
