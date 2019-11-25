The NewYorkTimes News

- API Key: pH4PGY4gblvAcFIMKV8x7MixeFUrf1AR
- API: 
    + Article api: https://api.nytimes.com/svc/archive/v1/{year}/{month}.json?api-key={yourkey}
        * Method: GET
        * Example: https://api.nytimes.com/svc/archive/v1/2019/11.json?api-key=pH4PGY4gblvAcFIMKV8x7MixeFUrf1AR
    + Article Search: https://api.nytimes.com/svc/search/v2/articlesearch.json?q={keyword}&api-key={yourkey}
        * Method: GET
        * Pagination: The Article Search API returns a max of 10 results at a time. 
        The meta node in the response contains the total number of matches ("hits") and the current offset.
        Use the page query parameter to paginate thru results (page=0 for results 1-10, page=1 for 11-20, ...). 
        You can paginate thru up to 100 pages (1,000 results).
        * Example: https://api.nytimes.com/svc/search/v2/articlesearch.json?q=election&api-key=pH4PGY4gblvAcFIMKV8x7MixeFUrf1AR&page=1

- App spec:
2 features: 
    1) Get latest ariticles in a month
    2) Search ariticles by text input

    + Get latest articles in a month:
        A dropdown menu to select a month (default is current month)
        A table view to display list of articles
        Call Article api to get all articles by a month -> fill data into table view
            Displayed information contains (from response api): 
                * thumbnail image = url of the first element of multimedia (https://www.nytimes.com + multimedia.first.url)
                * title label = headline.main
                * subtitle label = snippet
                * published date label = pub_date ( should be formatted )
        When user change month -> reload articles
        When user tap a articles -> open web_url of selected ariticle in webview

    + Search ariticles by text input:
        A search bar to enter keyword
        A table view to display results (list of articles)
        When user type the text -> perform search and display all results in table view
        When user tap Search button -> display keyboard

        The results should be paginated:
        When user pull down at top -> pull down to refresh
        when user pull up at bottom -> pull up to load more

        When user tap a articles -> open web_url of selected ariticle in webview

