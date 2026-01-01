(require 'ox-publish)

;; Global HTML Settings (Applying your Simple.css preference)
(setq org-html-validation-link nil
      org-html-head-include-scripts nil
      org-html-head-include-default-style nil
      org-html-head "<link rel=\"stylesheet\" href=\"https://cdn.simplecss.org/simple.min.css\" />")

(setq org-publish-project-alist
      (list
       ;; --- Component 1: The Blog Posts ---
       (list "blog"
             :base-directory "./content/blog"
             :base-extension "org"
             :publishing-directory "./public/blog"
             :recursive t
             :publishing-function 'org-html-publish-to-html
             :auto-sitemap t
             :sitemap-title "Articles & Thoughts"
             :sitemap-filename "archive.org"
             :sitemap-sort-files 'anti-chronologically
             :with-author nil
             :with-creator t
             :with-toc t
             :section-numbers nil
             :time-stamp-file nil)

       ;; --- Component 2: Static Pages (index.org) ---
       (list "pages"
             :base-directory "./content/"
             :base-extension "org"
             :exclude "blog/"
             :publishing-directory "./public/"
             :recursive nil
             :publishing-function 'org-html-publish-to-html
             :with-author nil
             :with-creator t
             :with-toc nil ;; Set to nil for a cleaner landing page
             :section-numbers nil
             :time-stamp-file nil)

       ;; --- Component 3: Assets ---
       (list "assets"
             :base-directory "./content/"
             :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf"
             :publishing-directory "./public/"
             :recursive t
             :publishing-function 'org-publish-attachment)

       ;; Combined Project
       (list "website" :components '("blog" "pages" "assets"))))

(org-publish-all t)
(message "Build complete!")
