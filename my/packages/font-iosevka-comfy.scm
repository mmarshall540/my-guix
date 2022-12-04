(define-module (my packages font-iosevka-comfy))
(use-modules ((guix licenses) #:prefix license:) 
	     (guix packages)
             (guix download)
	     (guix gexp)
             (guix build-system font))

(package
    (name "font-iosevka-comfy")
    (version "1.1.0")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://git.sr.ht/~protesilaos/iosevka-comfy/archive/"
                           version ".tar.gz"))
       (sha256
        (base32 "09zlvllw2rdi0hm9hnq08mnynjs2yb9lxf88y32zjd7lrjpbww9w"))))
    (build-system font-build-system)
    (home-page "https://git.sr.ht/~protesilaos/iosevka-comfy")
    (synopsis "Customised build of the Iosevka typeface.")
    (description
     "Iosevka Comfy optimises for inter-glyph and inter-style consistency
within the overarching constraint of usability at small point
sizes. The shapes are round and are designed in concert to both impose
a predictable rhythm and keep characters distinct from each other.")
    (license (list license:silofl1.1    ;build artifacts (i.e., the fonts)
                   license:bsd-3)))    ;supporting code
