(define-module (my packages emacs-pretty-speedbar))
(use-modules ((guix licenses) #:prefix license:) 
	     (guix packages)
             (guix download)
	     (guix gexp)
             (guix build-system emacs)
             (guix licenses)
	     (gnu packages fonts))

(package
 (name "emacs-pretty-speedbar")
 (version "20220303.1726")
 (source
   (origin
   (method url-fetch)
   (uri (string-append "https://melpa.org/packages/pretty-speedbar-" version ".el"))
   (sha256
    (base32 "0fgi660jcpq2jgvj9wcx44aw07vz8il6q9a0yl365dx7jlg6pb95"))))
 ;; pretty-speedbar-font defaults to "Font Awesome 6 Free Solid", but
 ;; the build scripts for version 5+ of Font Awesome are not GPL
 ;; compatible, thus Guix packages version 4.  However, version 4 of
 ;; the fonts seem to work just fine.  The only requirement is to
 ;; `(setq pretty-speedbar-font "FontAwesome Regular")'.  This will
 ;; need to be done in the Emacs configuration until I can figure out
 ;; how to patch this package through Guix.
 (build-system emacs-build-system)
 (propagated-inputs (list font-awesome))
 (home-page "https://github.com/kcyarn/pretty-speedbar")
 (synopsis "SVG icons for Emacs Speedbar")
 (description
  "Why turn off the ugly Emacs Speedbar icons when you can replace them
with pretty SVG icons customized to match your theme?")
 (license license:gpl3+))
