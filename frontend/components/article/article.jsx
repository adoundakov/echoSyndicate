import React from 'react';

class Article extends React.Component {
  componentWillMount() {
  }

  renderImage(source, img) {
    if (source !== "USA Today") {
      return <div className="article-img-frame"><img src={img} className="article-img" /></div>
    }
  }

  render() {
    let { title, date, author, image_url, source_name, description, article_url, pos, source_logo } = this.props;
    return (
      <div className={`article-box-${pos}`}>
        <div className="source-side">
          <div className="source-logo-frame">
            <img src={source_logo} className="source-logo"/>
          </div>
        </div>
        <a href={article_url} target="_blank" className="article-side">
          <div className="article-detail">
            { this.renderImage(source_name, image_url) }
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
