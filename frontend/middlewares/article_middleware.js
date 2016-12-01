import { FETCH_ARTICLES, GET_ARTICLES, receiveArticles } from '../actions/article_actions';
import { fetchArticlesAJAX, getArticlesAJAX } from '../utils/article_api_utils';

const ArticleMiddleware = ({dispatch}) => next => action => {
  const fetchArticlesCB = (articles) => {dispatch(receiveArticles(articles));};
  const getArticlesCB = (articles) => {dispatch(receiveArticles(articles));};
  const errorCB = (err) => {console.log(err);};
  switch (action.type) {
    case FETCH_ARTICLES:
      fetchArticlesAJAX(fetchArticlesCB, errorCB);
      return next(action);
    case GET_ARTICLES:
      getArticlesAJAX(action.limit, action.offset, getArticlesCB, errorCB);
      return next(action);
    default:
      return next(action);
  }
};

export default ArticleMiddleware;
