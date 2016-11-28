import { connect } from 'react-redux';
import Board from './board';
import { fetchArticles } from '../../actions/article_actions';
import { getArticles } from '../../utils/selectors';

const mapStateToProps = (state) => ({
   articles: getArticles(state.articles.list)
 });

 const mapDispatchToProps = (dispatch) => ({
    fetchArticles: ()=>{dispatch(fetchArticles());}
 });


 export default connect(mapStateToProps, mapDispatchToProps)(Board);
