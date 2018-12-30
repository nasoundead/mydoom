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

;; (setq doom-font (font-spec :family "Fira Mono"
;;                             :size 15))

(setq doom-font (font-spec :family "Fira Mono" :size 15)
      doom-variable-pitch-font (font-spec :family "Fira Sans")
      doom-unicode-font (font-spec :family "DejaVu Sans Mono")
      doom-big-font (font-spec :family "Fira Mono" :size 19))	

(setq doom-theme 'doom-tomorrow-night)	  
;; (setq doom-theme 'doom-peacock)	 

;; we want dired not not make always a new buffer if visiting a directory
;; but using only one dired buffer for all directories.
(defadvice dired-advertised-find-file (around dired-subst-directory activate)
  "Replace current buffer if file is a directory."
  (interactive)
  (let ((orig (current-buffer))
        (filename (dired-get-filename)))
    ad-do-it
    (when (and (file-directory-p filename)
               (not (eq (current-buffer) orig)))
      (kill-buffer orig))))

(eval-after-load "dired"
  ;; don't remove `other-window', the caller expects it to be there
  '(defun dired-up-directory (&optional other-window)
     "Run Dired on parent directory of current directory."
     (interactive "P")
     (let* ((dir (dired-current-directory))
            (orig (current-buffer))
            (up (file-name-directory (directory-file-name dir))))
       (or (dired-goto-file (directory-file-name dir))
           ;; Only try dired-goto-subdir if buffer has more than one dir.
           (and (cdr dired-subdir-alist)
                (dired-goto-subdir up))
           (progn
             (kill-buffer orig)
             (dired up)
             (dired-goto-file dir))))))

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
