Processing HTML from ecohealthalliance.org


REMOVE META ELEMENTS
/usr/local/bin/tidy -q -numeric -asxhtml --show-warnings no careers.html | xml ed -d //_:meta

ADD "Hello" as text before end of footer.
/usr/local/bin/tidy -q -numeric -asxhtml --show-warnings no careers.html | xml ed -a "//_:footer/child::node()[last()]" -t text -n "" -v "Hello"

Re-tidy after adding "Hello"
/usr/local/bin/tidy -q -numeric -asxhtml --show-warnings no careers.html | xml ed -a "//_:footer/child::node()[last()]" -t text -n "" -v "Hello" | /usr/local/bin/tidy -q -i --show-warnings no > test.html

Check that comment contains text:
/usr/local/bin/tidy -q -numeric -asxhtml --show-warnings no careers.html | xml sel -t -c "//comment()[contains(., 'SEO')]"

---
Example Makefile

SITE= .site
RM= rm -rf

all : site

site:
    jekyll build --source jekyll --destination $(SITE)

server:
    jekyll server --source jekyll --destination $(SITE) --watch

publish: site gh-pages

gh-pages:
    shell/publish gh-pages

clean :
    $(RM) $(SITE)
----

Use {{page.subhead | markdownify}} for hero-header
