import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';
import configureStore from './store/store';

document.addEventListener('DOMContentLoaded', (e)=>{
  const container = document.getElementById('container');
  const store = configureStore();
  window.store = store;
  ReactDOM.render(<Root store={store}/>, container);
});
