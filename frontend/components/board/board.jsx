import React from 'react';
import Article from '../article/article';

class Board extends React.Component {

  constructor(props) {
    super(props);
    this.state = {offset: 0};
  }

  componentWillMount() {
    this.props.getArticles(3, 0);
    this.setState({offset: 3});
  }

  componentDidMount() {
    window.addEventListener('scroll', () => {
      let articles = this.refs.board.firstChild.childNodes;
      let target = articles[articles.length - 1].offsetTop;
      let scanner = window.scrollY + window.innerHeight;
      let status = this.props.status;
      if (scanner > target && status === "READY") {
        this.props.getArticles(3,this.state.offset);
        this.setState({offset: this.state.offset + 3});
      }
    });
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
      <div ref="board" className="article-board">
        { this.renderArticles() }
      </div>
    );
  }
}

 export default Board;
