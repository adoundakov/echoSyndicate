import { connect } from 'react-redux';
import Board from './board';

const mapStateToProps = (state) => ({
   articles: state.articles
 });

 // const mapDispatchToProps = (dispatch) => ({
 //    fetchArticles: (id)=>{dispatch(fetchArticles(id));}
 // });
 //

 export default connect(mapStateToProps)(Board);
