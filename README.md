# echoSyndicate

#### [ES live](http://github.com/adoundakov/echoSyndicate)

## Background

Recently, there [has been](intro link 1) a [lot of](intro link 2) talk about echo chambers and the role that they play in our society. An [echo chamber](wiki def) in social media is essentially when information or ideas are reinforced by transmission and repetition in an enclosed system.

echoSyndicate was created to solve this problem by making the alternative viewpoint available, essentially breaking the echo chamber. echoSyndicate uses algorithms to dynamically match articles about the same subject, but from differing news sources, and juxtaposes them on the same web page. This ensures that a reader gets both sides of the story, and breaks through the echo chamber.

[intro link 1]: https://www.wired.com/2016/06/facebook-embraces-news-feed-echo-chamber/
[intro link 2]: https://www.wired.com/2016/11/filter-bubble-destroying-democracy/
[wiki def]: https://en.wikipedia.org/wiki/Echo_chamber_(media)

## Functionality and MVP

Our application will use a hand rolled algorithm to dynamically match articles based on their content. This will enable the app to automatically flag which articles are related (e.g. a CNN article with title “Trump picks nationalist for cabinet position” will be matched with Fox news article “Trump chooses military general for cabinet position”).

Additionally, our application will determine an article's political leaning using a combination of source analysis and natural language processing. We will combine our own insight into a news source's typical political leaning with an algorithmic assessment of keywords
used in the article's headline and body.

Although many of the news sources we will implement will be provided to us through News API, we will have to create our own automated scrapers to collect news from additional sources. Specifically, we will need to create a scraper for Fox News which is not included in News API. Bonus sources could include Sean Hannity's and Rush Limbaugh's websites, as well as Breitbart.

Time permitting, we would like to implement the following:
  - Add user profiles that track a user's click history and present news specific to that user's interests and political leanings. Based on a users preferences, the left news feed column would be targeted to their interests and the right column would be used to foil their political interests.
  - Increase the complexity of our political analysis by adding a 'conservative vs populist' layer to the traditional 'conservative vs liberal' layer. We could then assign two-dimensional scores that enable us to accurately foil articles and target specific articles to specific users.
  - Continue to add news sources. Each news source would require a one-off web scraper.
  - Utilizing our increasingly complex political analysis, we can then begin dynamically styling our news feed based upon the varying levels of conservativism / liberalism / populism / libertarianism.

## Wireframes

The average user will interact with the website through a News Feed. This news feed will be split into two columns, with two opposing viewpoints splitting the screen. There will be a slider in the header of the page that lets a user override the best-guess of their political leaning.

![](docs/splash.png)
![](docs/echoSyndicate.png)

## Technologies and Technical Challenges

This application will be implemented using a Ruby on Rails backend, a PostgreSQL database, and a React.js frontend. The frontend will leverage a GraphQL to accommodate dynamic querying from the frontend. Our pSQL database will automatically pull new stories using the News API and our hand rolled scrapers and apply algorithms to classify these articles by topic and political leaning, automatically dropping those articles that are no longer relevant.

We foresee the following technical challenges:

 - Internalizing the GraphQL / Relay paradigm, and applying it to our web app.
 - Designing the algorithms for classification and categorization of new news articles.
 - Hand-rolling scrapers for non-included news sources.
 - Automating data pipeline for new sources.

## Timeline

- **Day 1:** Backend setup, learning GraphQL paradigm
- **Day 2:**
- **Day 3:**
- **Day 4:**
- **Day 5:**
- **Day 6:**
- **Day 7:** 
- **Day 8:**
