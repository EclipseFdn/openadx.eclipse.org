---
title: "Home"
#seo_title: ""
headline: "OpenADx"
hide_sidebar : true
hide_page_title: true
hide_breadcrumb: true
subtitle: "Open Source for Autonomous Driving"
#description: ""
tagline: "xcelerate your autonomous driving development"
date: 2019-03-14T15:50:25-04:00
container: "container-fluid"
layout: "single"
---

{{< grid/section-container class="featured-section-news margin-bottom-50" >}}
  {{< grid/div class="col-sm-12" isMarkdown="false" >}}
    <h2 class="header-underline margin-bottom-10">News</h2>
    {{< newsroom/news id="news-template-id" class="news-list" includeList="true" publishTarget="openadx" >}}
  {{</ grid/div >}}
  {{< grid/div class="col-sm-8 col-sm-offset-1" isMarkdown="false" >}}
      <h2 class="header-underline margin-bottom-30">Events</h2>
      {{< newsroom/events
          id="event-list-container"
          publishTarget="openadx"
          class="event-list-custom"
          upcoming="1"
          templateId="custom-events-template"
          templatePath="/js/templates/event-list-format.mustache"
          count="4"
          includeList="true"
      >}}
  {{</ grid/div >}}
{{</ grid/section-container >}}

{{< homepage/vision >}}

{{< homepage/featured-tech-resources >}}

{{< homepage/working-group >}}
