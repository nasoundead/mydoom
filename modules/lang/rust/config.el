;;; lang/rust/config.el -*- lexical-binding: t; -*-

(after! projectile
  (add-to-list 'projectile-project-root-files "Cargo.toml"))


;;
;;; Packages

(use-package! rustic
  :mode ("\\.rs$" . rustic-mode)
  :commands rustic-run-cargo-command rustic-cargo-outdated
  :preface
  (setq rustic-rls-pkg (if (featurep! +lsp) 'lsp-mode))
  :config
  (set-docsets! 'rustic-mode "Rust")

  (setq rustic-indent-method-chain t
        rustic-flycheck-setup-mode-line-p nil
        ;; use :editor format instead
        rustic-format-on-save nil
        ;; REVIEW `rust-ordinary-lt-gt-p' is terribly expensive in large rust
        ;;        buffers, so we disable it, but only for evil users, because it
        ;;        affects `forward-sexp' and its ilk. See
        ;;        https://github.com/rust-lang/rust-mode/issues/288.
        rustic-match-angle-brackets (not (featurep! :editor evil))
        ;; `rustic-setup-rls' uses `package-installed-p' to determine if
        ;; lsp-mode/elgot are available. This breaks because Doom doesn't use
        ;; package.el to begin with (and lazy loads it). This is already handled
        ;; by the :tools lsp module, so...
        rustic-lsp-setup-p nil)

  (add-hook 'rustic-mode-hook #'rainbow-delimiters-mode)

  (when (featurep! +lsp)
    (add-hook 'rustic-mode-local-vars-hook #'lsp!))

  (map! :map rustic-mode-map
        :localleader
        (:prefix ("b" . "build")
          :desc "cargo audit"    "a" #'+rust/cargo-audit
          :desc "cargo build"    "b" #'rustic-cargo-build
          :desc "cargo bench"    "B" #'rustic-cargo-bench
          :desc "cargo check"    "c" #'rustic-cargo-check
          :desc "cargo clippy"   "C" #'rustic-cargo-clippy
          :desc "cargo doc"      "d" #'rustic-cargo-doc
          :desc "cargo fmt"      "f" #'rustic-cargo-fmt
          :desc "cargo new"      "n" #'rustic-cargo-new
          :desc "cargo outdated" "o" #'rustic-cargo-outdated
          :desc "cargo run"      "r" #'rustic-cargo-run)
        (:prefix ("t" . "cargo test")
          :desc "all"          "a" #'rustic-cargo-test
          :desc "current test" "t" #'rustic-cargo-current-test)))


(use-package! racer
  :unless (featurep! +lsp)
  :hook (rustic-mode . racer-mode)
  :config
  (set-lookup-handlers! 'rustic-mode
    :definition '(racer-find-definition :async t)
    :documentation '+rust-racer-lookup-documentation))
