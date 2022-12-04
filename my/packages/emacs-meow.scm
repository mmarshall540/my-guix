(use-modules (guix packages) (guix git-download) (gnu packages emacs-xyz) (gnu packages package-management) (guix build-system emacs))

;; Custom package definition to take advantage of recent bug fixes.
(let ((commit "da8143e108617bed89669ac34e43d092a0a0b9b4")
      (revision "1"))
  (define emacs-meow-1.4.2.1
    (package
     (inherit emacs-meow)
     (version (git-version "1.4.2.1" revision commit))
     (source
      (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/meow-edit/meow")
             (commit commit)))
       (sha256
	(base32 "1wxk3xf2d4q2vp9bh1ddj8g32pmrjdsb8rqfdmj2ca0pp5m9l6x4"))
       (file-name (git-file-name "emacs-meow" version))))))
  emacs-meow-1.4.2.1)
