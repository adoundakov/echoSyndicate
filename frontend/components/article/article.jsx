import React from 'react';

class Article extends React.Component {
  componentWillMount() {
  }

  render() {
    const { title, date, author, image_url, source_name, description, article_url, pos } = this.props;
    return (
      <div className={`article-box-${pos}`}>
        <div className="source-side">
          <div className="source-img-frame">
            <img src={image_url} className="source-img"/>
          </div>
        </div>
        <a href={article_url} target="_blank">
          <div className="article-side">
            <div className="article-title">{title}</div>
            <div className="article-author">By {author}</div>
            <div className="article-date">{date}</div>
            <div className="article-body">{description}</div>
          </div>
        </a>
      </div>
    );
  }
}

export default Article;
