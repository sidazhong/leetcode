for $item in doc("rssFeed2.rss")//item
let $term := "covid-19"
order by $item/pubDate descending
where $item/lower-case(description)[contains(.,lower-case($term))]
return $item