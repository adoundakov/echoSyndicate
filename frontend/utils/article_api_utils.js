export const fetchArticlesAJAX = (success, error) => {
  $.ajax({
    type: 'GET',
    url: 'api/articles',
    success,
    error
  });
};
