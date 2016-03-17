#! /usr/local/bin/Rscript --vanilla --default-packages=utils

# library("xml2")
# library("rvest")
# library("stringi")
#
# cpage = read_html("http://www.ecohealthalliance.org/careers")
#
# head = html_node(cpage, "head")
#
#
# head_stripped = html_nodes(cpage, xpath = "head/*[not(self::title or contains(@rel, 'canonical') or contains(@property, 'og:title') or contains(@property, 'og:description') or contains(@meta, 'og:url') or contains(@name, 'twitter:description') or contains(@name, 'twitter:title'))]")
# header = html_nodes(cpage, xpath = "//header/*[not(contains(@class, 'b-hero-header'))]")
# footer = html_nodes(cpage, xpath = '//footer')
#
# head_stripped = stri_replace_all_fixed(as.character(head_stripped), "href=\"/", "href=\"http://www.ecohealthalliance.org/")
# header = stri_replace_all_fixed(as.character(header), "href=\"/", "href=\"http://www.ecohealthalliance.org/")
# footer = stri_replace_all_fixed(as.character(footer), "href=\"/", "href=\"http://www.ecohealthalliance.org/")
# write_xml(head_stripped, con="_includes/head_eha_auto.html")
# writeLines(header, con="_includes/header_eha_auto.html")
# writeLines(footer, con="_includes/footer_eha_auto.html")
#
# writeLines(as.character(html_nodes(cpage, "head")), con="_includes/head_eha_auto.html")
# writeLines(as.character(html_nodes(cpage, "header")), con="_includes/header_eha_auto.html")
# writeLines(as.character(html_nodes(cpage, "footer")), con="_includes/footer_eha_auto.html")

library(XML)
library(stringi)
print_node_set = function(set, file) {
  oldwidth = getOption("width")
  options(width=10000)
  text = paste0(sapply(set, function(x) paste0(capture.output(print(x)), collapse="\n")), collapse="\n")
  text = stri_replace_all_fixed(as.character(text), "href=\"/", "href=\"http://www.ecohealthalliance.org/")
  text = stri_replace_all_regex(as.character(text), "(\\<script\\s.*)/>", "$1></script>")
  text = stri_replace_all_regex(as.character(text), "(\\<span\\s.*)/>", "$1></span>")
  text = stri_replace_all_regex(as.character(text), "(\\<i\\s.*)/>", "$1></i>")
  cat(text, file=file)
  options(width=oldwidth)
}
cpage = htmlParse("http://www.ecohealthalliance.org/careers")
head = getNodeSet(cpage, "//head/*[not(self::title or contains(@rel, 'canonical') or contains(@property, 'og:title') or contains(@property, 'og:description') or contains(@meta, 'og:url') or contains(@name, 'twitter:description') or contains(@name, 'twitter:title'))]")
header = getNodeSet(cpage, "//header/*[not(contains(@class, 'b-hero-header'))]")
footer = getNodeSet(cpage, "//footer/*")
print_node_set(head, "_includes/head_eha_auto.html")
print_node_set(header, "_includes/header_eha_auto.html")
print_node_set(footer, "_includes/footer_eha_auto.html")



