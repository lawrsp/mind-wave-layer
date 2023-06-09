;;; funcs.el --- mind-wave layer funcs file for Spacemacs. -*- lexical-binding: t -*-
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

(defun spacemacs//mind-wave-setup-global-bindings ()
  "Define keys bindings globally of mind-wave document assistant functions"
  (spacemacs/declare-prefix "mm"  "mind-wave")
  (spacemacs/set-leader-keys
    ;; Document mode
    ;; Selected Content:
    ;; Execute the command mind-wave-translate-to-english, ChatGPT will automatically replace the selected area with the translated content.
    "mmT" 'mind-wave-translate-to-english
    ;; Execute the command mind-wave-proofreading-doc, ChatGPT will automatically replace the selected area with the polished document.
    "mmp" 'mind-wave-proofreading-doc
    ;; Execute the command mind-wave-explain-word, ChatGPT will automatically explain the meaning of the words in the current sentence and provide similar example sentences.
    "mmt" 'mind-wave-explain-word
    ;; Execute the command mind-wave-adjust-text. ChatGPT will adjust the text or code according to your instructions.
    "mma" 'mind-wave-adjust-text
    ;; restore window configuration
    "mmW" 'mind-wave-restore-window-configuration))

(defun spacemacs//mind-wave-setup-prog-bindings ()
  "Define keys bindings of mind-wave prog assistant functions for mode"
  (let ((mode major-mode))
    (spacemacs/declare-prefix-for-mode mode "mm" "mind-wave")
    (spacemacs/set-leader-keys-for-major-mode mode
      "mg" 'mind-wave-generate-code
      ;; Code Refactoring Mode
      ;; Move the cursor to the desired function for refactoring.
      ;; Execute the command mind-wave-refactory-code, ChatGPT will automatically split the screen to display the refactored code and suggestions for improvement on the right.
      "mr" 'mind-wave-refactory-code
      ;; Execute the command mind-wave-comment-code, ChatGPT will automatically split the screen to display code with comments on the right.
      "mc" 'mind-wave-comment-code
      ;; Execute the command mind-wave-explain-code, ChatGPT will automatically split the screen to display an explanation for the code on the right.
      "me" 'mind-wave-explain-code
      ;; Execute the command mind-wave-explain-point, ChatGPT will automatically split the screen and display the API explanation on the right side of the screen where the cursor is located
      "mE" 'mind-wave-explain-point
      ;; Execute the command mind-wave-generate-commit-name, ChatGPT will automatically analyze the current diff content and generate a patch name.
      ;; "mn" 'mind-wave-generate-commit-name
      ;; Execute the command mind-wave-refactory-code-with-input. ChatGPT will automatically split the screen and provide you with the refactored code and suggestions based on your prompts on the right side of the screen
      "mR" 'mind-wave-refactory-code-with-input
      )))
