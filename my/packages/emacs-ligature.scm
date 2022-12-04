(define-module (my packages emacs-ligature))
(use-modules ((guix licenses) #:prefix license:) 
	     (guix packages)
             (guix download)
	     (guix gexp)
             (guix build-system emacs)
             (guix licenses))

(package
 (name "emacs-ligature")
 (version "20220808.1225")
 (source
   (origin
   (method url-fetch)
   (uri (string-append "https://melpa.org/packages/ligature-" version ".el"))
   (sha256
    (base32 "0iwj8wgair52pxr3ddnkd0xs9gj3lj2l13b3lmml4l737pva5dlc"))))
 (build-system emacs-build-system)
 (home-page "https://github.com/mickeynp/ligature.el")
 (synopsis "Display typographical ligatures in Emacs")
 (description
  "This package maps ordinary graphemes (characters) to fancy ligatures,
if both your version of Emacs and the font supports it.")
 (license license:gpl3+))
