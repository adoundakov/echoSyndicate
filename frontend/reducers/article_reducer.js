const _nullArticles = {
  list: {},
  errors: []
};

const ArticleReducer = (state = _nullArticles, action) => {
  Object.freeze(state);
  switch(action.type) {
    default:
      return state;
  }
};

export default ArticleReducer;
