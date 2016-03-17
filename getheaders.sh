

curl http://www.ecohealthalliance.org/careers | \
/usr/local/bin/tidy -i -w -q -numeric -ashtml --show-warnings no --drop-empty-paras no --drop-empty-elements no --join-styles no --tidy-mark no > careers.html

xml sel -I -t -c "//_:head/*[not(self::title or contains(@rel, 'canonical') or contains(@property, 'og:title') or contains(@property, 'og:description') or contains(@meta, 'og:url') or contains(@name, 'twitter:description') or contains(@name, 'twitter:title'))]" careers.html  | \
  sed 's/href="\//href="http:\/\/www.ecohealthalliance.org\//g' > \
  _includes/head_eha_auto.html
xml sel -I -t -c "//_:header/*[not(contains(@class, 'b-hero-header'))]" careers.html | \
  sed 's/href="\//href="http:\/\/www.ecohealthalliance.org\//g' > \
  _includes/header_eha_auto.html
xml sel -I -t -c "//_:footer/*" careers.html | \
  sed 's/href="\//href="http:\/\/www.ecohealthalliance.org\//g' > \
  _includes/footer_eha_auto.html

#   /usr/local/bin/tidy -i -w -q -numeric --show-warnings no --drop-empty-paras no --drop-empty-elements no --join-styles no --tidy-mark no --show-body-only > \
