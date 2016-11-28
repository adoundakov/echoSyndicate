import { isEmpty } from 'lodash';

export const getArticles = (list) => {
  if (list === undefined || list.length === 0) {
    return null;
  }
  return list;
};
