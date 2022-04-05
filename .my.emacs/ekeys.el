(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
(global-set-key (kbd "\C-c e") 'ispell-word)
(global-set-key "\M-r" 'shell-command)

(defun prev-window ()
  (interactive nil)
  (other-window -1))
(global-set-key "\M-o" `prev-window)
(global-set-key "\C-xp" `prev-window)
