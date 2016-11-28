import React from 'react';
import { createStore } from 'redux';
import RootReducer from '../reducers/root_reducer';
import MasterMiddleware from '../middlewares/master_middleware';

const configureStore = (preloadedState = {}) => {
  return createStore(RootReducer, preloadedState, MasterMiddleware);
};

export default configureStore;
