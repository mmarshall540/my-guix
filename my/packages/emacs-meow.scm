(define-module (my packages emacs-meow))
(use-modules ((guix licenses) #:prefix license:) 
	     (guix packages)
             (guix download)
	     (guix gexp)
             (guix build-system emacs)
             (guix licenses)
	     (guix git-download))

;; Custom package definition to take advantage of recent bug fixes.
(let ((commit "da8143e108617bed89669ac34e43d092a0a0b9b4")
      (revision "1"))
(package
 (name "emacs-meow")
 (version (git-version "1.4.2" revision commit))
 (source
  (origin
   (method git-fetch)
   (uri (git-reference
         (url "https://github.com/meow-edit/meow")
         (commit commit)))
   (file-name (git-file-name name version))
   (sha256
    (base32 "1wxk3xf2d4q2vp9bh1ddj8g32pmrjdsb8rqfdmj2ca0pp5m9l6x4"))))
 (build-system emacs-build-system)
 (home-page "https://github.com/meow-edit/meow")
 (synopsis "Yet another modal editing on Emacs")
 (description "Meow is yet another modal editing mode for Emacs.  It aims
to blend modal editing into Emacs with minimum interface with its original
key-bindings, avoiding most if not all the hassle introduced by key-binding
conflicts.")
 (license license:gpl3+)))
