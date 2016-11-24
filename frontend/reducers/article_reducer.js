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
      newState = merge({}, state, {list: action.articles});
      return newState;
    default:
      return state;
  }
};

export default ArticleReducer;
