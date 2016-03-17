---
title: Live Science
layout: page
subhead: "**Live Science** is EcoHealth Alliance's site for in-progress analyses and scientific reports that we share with our partners, the research community and the public."
---

<div class="home">

<div class="page-content" itemprop="articleBody" markdown="1">

<img src="{{site.baseurl}}/predict/predictfooter.png">


# Emerging Disease Insights from the [**PREDICT**](http://www.vetmed.ucdavis.edu/ohi/predict/index.cfm) Modeling and Analytics Team

<br/>

</div>
  <ul class="post-list">
    {% for post in site.categories.predict %}
      <li>
        <span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}</span>

        <h2>
          {{ post.title }} <a href="{{ post.pdf | prepend: site.baseurl }}">[PDF]</a>
        </h2>

      </li>
    {% endfor %}
  </ul>

  <p class="rss-subscribe">Subscribe <a href="{{ "/predict/predict.xml" | prepend: site.baseurl }}">via RSS</a></p>

</div>
