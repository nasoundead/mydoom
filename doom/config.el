;;; config.el -*- lexical-binding: t; -*-

;;
;; Plugins
;;



;;
;; Config
;;

;; (setq fonts
;; 	(cond ((eq system-type 'darwin)     '("Monaco"    "STHeiti"))
;; 	      ((eq system-type 'gnu/linux)  '("Menlo"     "WenQuanYi Micro Hei Mono"))
;; 	      ((eq system-type 'windows-nt) '("Ubuntu Mono"  "宋体"))))
  ;; (set-face-attribute 'default nil :font
	;; 	      (format "%s:pixelsize=%d" (car fonts) 14))
  ;; (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ;;   (set-fontset-font (frame-parameter nil 'font) charset
	;; 	      (font-spec :family (car (cdr fonts)))))
  ;; Fix chinese font width and rescale
  ;; (setq face-font-rescale-alist '(("宋体". 1.0) ("Microsoft Yahei" . 1.2) ("WenQuanYi Micro Hei Mono" . 1.2) ("STHeiti". 1.2)))

  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(org-table ((t (:family "Ubuntu Mono"))))
   )

;; (when (string-equal system-type "windows-nt")
;;   (setq exec-path
;;     '(
;;     "C:/Program Files (x86)/Emacs/emacs/bin/"
;;     "C:/Program Files (x86)/Emacs/EmacsW32/gnuwin32/bin/"
;;     "C:/Windows/system32/"
;;     "C:/Windows/"
;;     "C:/Windows/System32/Wbem/"
;;     "C:/Windows/system32/WindowsPowerShell/v1.0/"
;; 	"C:/Program Files/Git/bin/git.exe"
;; 	"D:/forwin/bin/"
;;     ))
;;   (setenv "PATH" (mapconcat #'identity exec-path path-separator))
;;  )

(setq doom-theme 'doom-nord)
(setq doom-font (font-spec :family "Fira Code" :size 14)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 19))

(map! :v "v" #'er/expand-region
      :v "V" #'er/contract-region)
