(use-modules (guix packages) (gnu packages emacs-xyz))

;; Custom package definition to take advantage of recent bug fixes.
(define emacs-meow-1.4.3
  (package
   (inherit emacs-meow)
   (version "1.4.3")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/meow-edit/meow")
           (commit "da8143e108617bed89669ac34e43d092a0a0b9b4")))
     (file-name (git-file-name name version))
     (sha256
      (base32 "1wxk3xf2d4q2vp9bh1ddj8g32pmrjdsb8rqfdmj2ca0pp5m9l6x4"))))))
