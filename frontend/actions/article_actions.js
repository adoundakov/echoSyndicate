export const FETCH_ARTICLES = "FETCH_ARTICLES";
export const GET_ARTICLES = "GET_ARTICLES";
export const RECEIVE_ARTICLES = "RECEIVE_ARTICLES";

export const fetchArticles = () => ({
  type: FETCH_ARTICLES
});

export const getArticles = (limit, offset) => ({
  type: GET_ARTICLES,
  limit,
  offset
});

export const receiveArticles = (articles) => ({
  type: RECEIVE_ARTICLES,
  articles
});
