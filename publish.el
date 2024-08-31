#!/usr/bin/env sh
":"; exec emacs --no-window-system --quick --script "$0" -- "$@" # -*- mode: emacs-lisp; lexical-binding: t; -*-

(require 'package)

(setq package-user-dir (file-truename (concat default-directory ".packages")))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(setq package-list '(denote))

(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(dolist (package package-list)
  (require package))

(require 'ox-publish)

(setq org-directory default-directory)
(setq denote-directory default-directory)

(setq org-publish-project-alist
      '(("orgfiles"
         :base-directory "./notes/"
         :base-extension "org"
         :publishing-directory "./public/"
         :publishing-function org-md-publish-to-md
         :recursive t)))

(org-publish-all t)

(kill-emacs 0)
