;;;; mud.lisp

(in-package #:socketmud-lisp)

;; MUD Specific Settings
(defconst +port+ 9009)

(defconst +pulses-per-second+ 4)

;;;; Structures
(deftype time-t ()
  nil)

(deftype d-socket ()
  nil)

;; Mobile Structure
(defstruct d-mobile
  "Structure provides connection between player information and socket."
  (socket   nil :type (or null d-socket))
  (events   nil :type list)
  (name     ""  :type string)
  (password ""  :type string)
  (level    0   :type integer))

;; Socket Structure
(defstruct d-socket
  "Structure provides glue between socket and player."
  (player           nil   :type (or null d-mobile))
  (events           nil   :type list)
  (hostname         ""    :type string)
  (in-buf           ""    :type string)
  (out-buf          ""    :type string)
  (next-command     ""    :type string)
  (bust-prompt      t     :type boolean)
  (lookup-status    'none :type symbol)
  (state            'none :type symbol)
  (control          'none :type symbol)
  (top-output       'none :type symbol)
  (compressing      'none :type symbol)
  (out-compress     ""    :type string)
  (out-compress-buf ""    :type string))

;; Help Structure
(defstruct help-data
  (load-time 0  :type time-t)
  (keyword   "" :type string)
  (text      "" :type string))

(defstruct lookup-data
  (dsock nil :type (or null d-socket))
  (buf   ""  :type string))

(defstruct cmd-type
  (name "" :type string)
  (func nil :type (or null function))
  (level 0 :type integer))

;;;; GLOBALS
(defvar *dsock-free*   nil)
(defvar *dsock-list*   nil)
(defvar *dmobile-free* nil)
(defvar *dmobile-list* nil)
(defvar *help-list*    nil)

;; TODO: Fix this to be a proper look-up table
(defvar *cmd-table*    nil)

(defvar *shut-down*    nil)
(defvar *greeting*     "")
(defvar *motd*         "")
(defvar *control*      0)
(defvar *current-time* 0)
