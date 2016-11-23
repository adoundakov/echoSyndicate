import React from 'react';
import { Provider } from 'react-redux';
import { Router, hashHistory, Route, IndexRoute } from 'react-router';
import App from './app';
import BoardContainer from './board/board_container';

const Root = ({store}) => {
  return (
    <Provider store={store}>
      <Router history={hashHistory}>
        <Route path="/" component={App}>
          <IndexRoute component={BoardContainer} />
        </Route>
      </Router>
    </Provider>
  );
};

export default Root;
