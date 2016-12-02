import { connect } from 'react-redux';
import Board from './board';
import { fetchArticles, getArticles } from '../../actions/article_actions';
import { retrieveArticles } from '../../utils/selectors';

const mapStateToProps = (state) => ({
   articles: retrieveArticles(state.articles.list),
   status: state.articles.status
 });

 const mapDispatchToProps = (dispatch) => ({
    fetchArticles: ()=>{dispatch(fetchArticles());},
    getArticles: (limit, offset)=>{dispatch(getArticles(limit, offset));}
 });


 export default connect(mapStateToProps, mapDispatchToProps)(Board);
