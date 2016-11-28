export const FETCH_ARTICLES = "FETCH_ARTICLES";
export const RECEIVE_ARTICLES = "RECEIVE_ARTICLES";

export const fetchArticles = () => ({
  type: FETCH_ARTICLES
});

export const receiveArticles = (articles) => ({
  type: RECEIVE_ARTICLES,
  articles
});
