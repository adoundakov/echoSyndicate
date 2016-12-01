import { merge } from 'lodash';
import { RECEIVE_ARTICLES } from '../actions/article_actions';

const _nullArticles = {
  list: [],
  errors: []
};

const ArticleReducer = (state = _nullArticles, action) => {
  Object.freeze(state);
  let newState;
  switch(action.type) {
    case RECEIVE_ARTICLES:
      newState = merge({}, state);
      action.articles.forEach((article)=>{
        newState.list.push(article);
      });
      return newState;
    default:
      return state;
  }
};

export default ArticleReducer;
