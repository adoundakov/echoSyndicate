import { applyMiddleware } from 'redux';
import ArticleMiddleware from './article_middleware';

export default applyMiddleware(ArticleMiddleware);
