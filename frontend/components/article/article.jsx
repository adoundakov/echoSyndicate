import React from 'react';

class Article extends React.Component {
  render() {
    return (
      <div className="article-box">
        <div className="source-side">
          <div className="source-img-frame">
            <img src="https://static01.nyt.com/images/icons/t_logo_291_black.png" className="source-img"/>
          </div>
        </div>
        <div className="article-side">
          <div className="article-title">Title</div>
          <div className="article-author">Author</div>
          <div className="article-date">Date</div>
          <div className="article-body">Body</div>
        </div>
      </div>
    );
  }
}

export default Article;
