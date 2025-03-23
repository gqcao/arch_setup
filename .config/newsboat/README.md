## How to extract rss feed from YouTube channel
- The template from YouTube channel is `https://www.youtube.com/feeds/videos.xml?channel_id=THE_CHANNEL_ID_HERE`.
- Open the desired YouTube channel page.
- Open the view-source of that page (one of the following):
    ```
    Ctrl+U.
    Right click --> View page source.
    Add view-source: to the beginning of the url in the address bar.
    ```
- Search for the term `externalId` or `channel_id`
- Right after it, there will be a random code (the channel id) to be replaced in the template in the first item. 
