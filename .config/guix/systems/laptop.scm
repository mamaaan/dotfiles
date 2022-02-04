(define-module (laptop)
  #:use-module (base-system)
  #:use-module (gnu))

(operating-system
 (inherit base-operating-system)
 (host-name "laptop")

 (mapped-devices
  (list (mapped-device
         (source (uuid "19f641f5-5eef-46ca-a7c0-a87d2ab6fed3"))
         (target "system-root")
         (type luks-device-mapping))))

 (file-systems (cons*
                (file-system
                 (device (file-system-label "system-root"))
                 (mount-point "/")
                 (type "ext4")
                 (dependencies mapped-devices))
                (file-system
                 (device "/dev/nvme0n1p1")
                 (mount-point "/boot/efi")
                 (type "vfat"))
                %base-file-systems)))
