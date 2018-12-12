;;; config.el -*- lexical-binding: t; -*-

;; (if (featurep! +bindings) (load! "+bindings"))


;;
;; Plugins
;;

;; (def-package! emacs-snippets
;;   :if (featurep! +snippets)
;;   :after yasnippet)


;;
;; Config
;;

;; (setq doom-font (font-spec :family "Source Code Pro"
;;                             :size 15))

(setq doom-font (font-spec :family "Fira Mono"
                            :size 15))
(when IS-WINDOWS
;; Setting English Font
;; (set-face-attribute 'default nil :font "Monaco 11")

;; Chinese Font
; (dolist (charset '(kana han symbol cjk-misc bopomofo))
  ; (set-fontset-font (frame-parameter nil 'font)
                    ; charset (font-spec :family "宋体"
                                       ; :size 16)))
;(set-fontset-font "fontset-default" 'chinese-gbk "宋体")
;(setq face-font-rescale-alist '(("宋体" . 1.2) ("微软雅黑" . 1.1)))
)
