---
layout: page
title: PREDICT Reports
permalink: predict/
categories: predict
---


<div class="home">

<div class="page-content" itemprop="articleBody" markdown="1">

![](predictfooter.png)

  <header class="post-header">
    <h1 class="post-title">{{ page.title }}</h1>
  </header>


Here you will find reports and ongoing work from the [PREDICT](http://www.vetmed.ucdavis.edu/ohi/predict/index.cfm) Modeling and Analytics team.

</div>
  <ul class="post-list">
    {% for post in site.categories.predict %}
      <li>
        <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>

        <h2>
          <a class="post-link" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
        </h2>

         <div class="post-content" itemprop="articleBody">
           {{ post.content }}
         </div>

      </li>
    {% endfor %}
  </ul>

  <p class="rss-subscribe">Subscribe <a href="{{ "predict/predict.xml" | prepend: site.baseurl }}">via RSS</a></p>

</div>
