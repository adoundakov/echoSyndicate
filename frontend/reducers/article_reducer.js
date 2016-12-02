import { merge } from 'lodash';
import { FETCH_ARTICLES, GET_ARTICLES, RECEIVE_ARTICLES } from '../actions/article_actions';

const _nullArticles = {
  list: [],
  errors: [],
  status: "READY"
};

const ArticleReducer = (state = _nullArticles, action) => {
  Object.freeze(state);
  let newState;
  switch(action.type) {
    case FETCH_ARTICLES:
    case GET_ARTICLES:
      newState = merge({}, state);
      newState.state = "REQUESTING";
      return newState;
    case RECEIVE_ARTICLES:
      newState = merge({}, state);
      action.articles.forEach((article)=>{
        newState.list.push(article);
      });
      newState.status = "READY";
      return newState;
    default:
      return state;
  }
};

export default ArticleReducer;
