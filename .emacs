; no menus
(menu-bar-mode 0)

(add-to-list 'load-path "~/.my.emacs/")

(load-library "ekeys")
(load-library "my-customizations")
 


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ess-own-style-list
   '((ess-indent-offset . 2)
     (ess-offset-arguments . open-delim)
     (ess-offset-arguments-newline . prev-line)
     (ess-offset-block . prev-line)
     (ess-offset-continued . straight)
     (ess-align-continuations-in-calls . nil)
     (ess-align-blocks control-flow)
     (ess-indent-from-lhs arguments fun-decl-opening)
     (ess-indent-from-chain-start . t)
     (ess-indent-with-fancy-comments)))
 '(package-selected-packages
   '(yaml-mode dockerfile-mode shackle ws-butler poly-R poly-markdown polymode markdown-preview-mode lsp-metals lsp-mode magit ess doom-themes monokai-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq shackle-default-rule '(:same t))

;; (split-window-right)
;; (other-window 1)
;; (R)
;; (other-window 1)
;; (split-window-below)
;; (other-window 1)
;; (shell)
;; (other-window -1)
