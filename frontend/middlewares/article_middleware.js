import { FETCH_ARTICLES, receiveArticles } from '../actions/article_actions';
import { fetchArticlesAJAX } from '../utils/article_api_utils';

const ArticleMiddleware = ({dispatch}) => next => action => {
  const fetchArticlesCB = (articles) => {dispatch(receiveArticles(articles));};
  const errorCB = (err) => {console.log(err);};
  switch (action.type) {
    case FETCH_ARTICLES:
      fetchArticlesAJAX(fetchArticlesCB, errorCB);
      return next(action);
    default:
      return next(action);
  }
};

export default ArticleMiddleware;
