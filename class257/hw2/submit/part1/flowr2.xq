let $term := "covid-19",
    $doc := (
      doc("rssFeed1.rss")//item,
      doc("rssFeed2.rss")//item,
      doc("rssFeed3.rss")//item,
      doc("rssFeed4.rss")//item,
      doc("rssFeed5.rss")//item
    )
for $item in $doc
order by $item/lower-case(pubDate) descending
where 
  $item/lower-case(description)[contains(.,lower-case($term))] or
  $item/lower-case(title)[contains(.,lower-case($term))]

return $item