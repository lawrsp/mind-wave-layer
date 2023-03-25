;;; packages.el --- mind-wave layer packages file for Spacemacs. -*- lexical-binding: t -*-
;;
;; Copyright (c) 2012-2022 Sylvain Benner & Contributors
;;
;; Author: lawrsp <lawrancersp@gmail.com>
;; URL: https://github.com/lawrsp
;;
;; This file is not part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.


(setq mind-wave-packages
      '(
        (mind-wave :location (recipe
                              :fetcher github
                              :repo "manateelazycat/mind-wave"
                              :files ("*.py" "*.el")))
        ))

(defun mind-wave/init-mind-wave ()
  (use-package mind-wave
    :commands (mind-wave-chat-mode
               mind-wave-translate-to-english
               mind-wave-proofreading-doc
               mind-wave-explain-word
               mind-wave-adjust-text
               mind-wave-refactory-code
               mind-wave-comment-code
               mind-wave-explain-code
               mind-wave-generate-commit-name
               mind-wave-restore-window-configuration
               )
    :mode ("\\.chat$" . mind-wave-chat-mode)
    :init
    (progn
      (add-hook 'prog-mode-hook 'spacemacs//mide-wave-setup-prog-bindings)
      (spacemacs//mide-wave-setup-global-bindings))
    :config
    (progn
      (spacemacs/set-leader-keys-for-major-mode 'mind-wave-chat-mode
        ;; Create a test.chat file to automatically enter mind-wave-chat-mode.
        ;; Execute the command mind-wave-chat-ask (press Ctrl + j), input your question, and wait for ChatGPT to respond.
        "j" #'mind-wave-chat-ask
        ;; Execute the command mind-wave-chat-continue (press Ctrl + u) to continue the conversation.
        "u" #'mind-wave-chat-continue
        ;; Execute the command mind-wave-chat-generate-title (press Ctrl + i) to generate a new title based on the content.
        "i" #'mind-wave-chat-generate-title
        ;; Execute the command mind-wave-chat-ask-with-multiline (press Ctrl + Shift + j), input multiple questions, and wait for ChatGPT to respond.
        "J" #'mind-wave-chat-ask-with-multiline
        ;; Execute the command mind-wave-chat-ask-insert-line to insert the ----- User ------ separator, continue inputting multiple lines in the buffer, and finally execute mind-wave-chat-ask-send-buffer.
        "l" #'mind-wave-chat-ask-insert-line
        "s" #'mind-wave-chat-ask-send-buffer))))
