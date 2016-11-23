import { combineReducers } from 'redux';
import ArticleReducer from './article_reducer';

const RootReducer = combineReducers({
  articles: ArticleReducer
});

export default RootReducer;
