(global-set-key "\M-r" 'shell-command)

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
 '(package-selected-packages
   '(poly-R poly-markdown polymode markdown-preview-mode lsp-metals lsp-mode magit ess doom-themes monokai-theme use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



