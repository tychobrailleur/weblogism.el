(add-to-list 'load-path "~/.emacs.d/elpa/templatel-20210902.228")
(add-to-list 'load-path "~/dev/weblorg")


(require 'weblorg)
(require 'templatel)

(weblorg-site
 :template-vars '(("site_name" . "Weblogism")
                  ("site_owner" . "sebastien@weblogism.com")
                  ("site_description" . "Weblogism")))

;; route for rendering each post
(weblorg-route
 :name "posts"
 :input-pattern "posts/*.org"
 :template "post.html"
 :output "output/posts/{{ slug }}.html"
 :url "/posts/{{ slug }}.html")

;; route for rendering the index page of the blog
(weblorg-route
 :name "blog"
 :input-pattern "posts/*.org"
 :input-aggregate #'weblorg-input-aggregate-all-desc
 :template "blog.html"
 :output "output/index.html"
 :url "/")

;; route for rendering each page
;; (weblorg-route
;;  :name "pages"
;;  :input-pattern "pages/*.org"
;;  :template "page.html"
;;  :output "output/{{ slug }}.html"
;;  :url "/{{ slug }}.html")

;; route for static assets that also copies files to output directory
(weblorg-copy-static
 :output "output/static/{{ file }}"
 :url "/static/{{ file }}")

;; fire the engine and export all the files declared in the routes above
(weblorg-export)
