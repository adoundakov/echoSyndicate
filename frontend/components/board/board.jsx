import React from 'react';
import Article from '../article/article';

class Board extends React.Component {

  componentWillMount() {
    this.props.fetchArticles();
  }

  renderArticles() {
    if (this.props.articles === null) {
      return (<div>Lodaing...</div>);
    }
    const articleList = this.props.articles.map((article, i) => {
      const { title, author, date, body } = article;
      return <Article {...article} key={i}/>;
    });
    return (<ul>{articleList}</ul>);
  }

  render() {
    return (
      <div className="article-board">
        { this.renderArticles() }
      </div>
    );
  }
}

 export default Board;
