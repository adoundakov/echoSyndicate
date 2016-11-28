import React from 'react';
import Article from '../article/article';

class Board extends React.Component {

  componentWillMount() {
    this.props.fetchArticles();
  }

  renderArticles() {
    if (this.props.articles === null) {
      return (<div>Loading...</div>);
    }
    const articleList = this.props.articles.map((pair, i) => {
      const { title, author, date, body } = pair[0];
      return (<div key={i}>
        <Article {...pair[0]} pos="left"/>
        <Article {...pair[1]} pos="right"/>
      </div>);
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
