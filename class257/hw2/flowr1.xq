let $dateline := "Sat, 03 Oct"
for $news in doc("rssFeed2.rss")//item
where $news/pubDate[contains(.,$dateline)]
return $news/title