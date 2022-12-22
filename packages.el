(defconst astro-packages
  '(
    polymode
    web-mode
    ))

(defun astro/init-web-mode ())

(defun astro/init-polymode ()
  (use-package polymode
    :mode (("\\.astro"   . astro-mode))
    :init
    (progn
      (define-hostmode poly-astro-hostmode :mode 'web-mode)
      (define-innermode poly-astro-js-innermode
        :mode 'js2-mode
        :head-matcher "\\`[ \t\n]*---\n"
        :tail-matcher "^---\n"
        :head-mode 'fundamental-mode
        :tail-mode 'fundamental-mode)
      (define-polymode poly-astro
        :hostmode 'poly-astro-hostmode
        :innermodes '(poly-astro-js-innermode))
      (defun astro-mode ()
        "Javascript and web-mode for astro files"
        (interactive)
        (setq web-mode-enable-front-matter-block nil)
        (poly-astro))
      ))
  )
