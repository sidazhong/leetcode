let $dateline := "Fri, 02 Oct", 
    $doc := (
      doc("rssFeed1.rss")//item,
      doc("rssFeed2.rss")//item,
      doc("rssFeed3.rss")//item,
      doc("rssFeed4.rss")//item,
      doc("rssFeed5.rss")//item
    )
for $news in $doc
where $news/pubDate[contains(.,$dateline)]
return $news/title