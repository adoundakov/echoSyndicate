export const fetchArticlesAJAX = (success, error) => {
  $.ajax({
    type: 'GET',
    url: 'api/articles',
    success,
    error
  });
};

export const getArticlesAJAX = (limit, offset, success, error) => {
  $.ajax({
    type: 'GET',
    url: `api/get_articles/${limit}/${offset}`,
    success,
    error
  });
};
