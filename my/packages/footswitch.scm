(define-module (my packages footswitch)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system gnu)
  #:use-module (guix build-system glib-or-gtk)
  #:use-module (guix build-system meson)
  #:use-module (gnu packages)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages ocaml)
  #:use-module (gnu packages pcre)
  #:use-module (gnu packages polkit)
  #:use-module (gnu packages ncurses)
  #:use-module (gnu packages music)
  #:use-module (gnu packages language)
  #:use-module (gnu packages icu4c)
  #:use-module (gnu packages speech)
  #:use-module (gnu packages linux)
  #:use-module (gnu packages documentation)
  #:use-module (gnu packages swig)
  #:use-module (gnu packages libusb)
  #:use-module (gnu packages java)
  #:use-module (gnu packages python)
  #:use-module (gnu packages python-xyz)
  #:use-module (gnu packages tcl)
  #:use-module (gnu packages xml)
  #:use-module (gnu packages gnome)
  #:use-module (gnu packages gstreamer)
  #:use-module (gnu packages gtk)
  #:use-module (gnu packages xorg)
  #:use-module (gnu packages gettext)
  #:use-module (gnu packages glib)
  #:use-module (gnu packages pkg-config)
  #:use-module (gnu packages libusb))

(let ((commit "e455d6752221b9e9c3818cc304c873b9c2792490")
        (revision "1"))
    (package
      (name "footswitch")
      (version (git-version "1.0" revision commit))
      (source (origin
                (method git-fetch)
                (uri (git-reference
                      (url "https://github.com/rgerganov/footswitch")
                      (commit commit)))
                (file-name (git-file-name name version))
                (sha256
                 (base32
                  "0xkk60sg3szpgbl3z8djlpagglsldv9viqibsih6wcnbhikzlc6j"))))
      (build-system gnu-build-system)
      (native-inputs
       (list pkg-config))
      (inputs
       (list hidapi))
      (arguments
       `(#:tests? #f ; no tests
         #:make-flags (list (string-append "CC=" ,(cc-for-target)))
         #:phases (modify-phases %standard-phases
                    (delete 'configure)
                    ;; Install target in the Makefile does not work for Guix
                    (replace 'install
                      (lambda* (#:key outputs #:allow-other-keys)
                        (let ((bin (string-append (assoc-ref outputs "out")
                                                  "/bin")))
                          (install-file "footswitch" bin)
                          (install-file "scythe" bin)
                          #t))))))
      (home-page "https://github.com/rgerganov/footswitch")
      (synopsis "Command line utility for PCsensor and Scythe foot switches.")
      (description
       "Command line utlities for programming PCsensor and Scythe foot switches.  There is support for both single pedal devices and three pedal devices.  Use the footswitch binary for the following combinations of vendorId:productId: 0c45:7403, 0c45:7404, 413d:2107, 1a86:e026.  Scythe switches with vendorId:productId=0426:3011 can be programmed with the scythe binary.  You can find the vendorId and productId of your device using the lsusb command on Linux.")
    (license license:expat)))
