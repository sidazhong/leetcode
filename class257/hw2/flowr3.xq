(for $item in doc("rssFeed4.rss")//item
let $term := "mars"
order by $item/pubDate descending
where $item/lower-case(description)[contains(.,lower-case($term))]
return $item/pubDate)[position() = 1]