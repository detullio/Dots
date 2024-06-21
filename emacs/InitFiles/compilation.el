
;;Wrap compilation windows
(defun my-compilation-mode-hook ()
  (setq truncate-lines nil)
  (setq truncate-partial-width-windows nil))
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

(add-hook 'compilation-mode-hook (lambda () (text-scale-increase 2)))

;;other compilation stuff
(setq comint-scroll-to-bottom-on-input (quote this))
(setq compilation-auto-jump-to-first-error nil)
(setq compilation-context-lines 9)
(setq compilation-scroll-output (quote first-error))
(setq compilation-skip-threshold 2)
(setq compilation-skip-visited t)
(setq compilation-window-height 20)
;;(setq compile-command "scons ")

(setq compile-command "cmake --build ~/working/building/")

;;SCons file font-lock
(setq auto-mode-alist
      (cons '("SConstruct" . python-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("SConscript" . python-mode) auto-mode-alist))
