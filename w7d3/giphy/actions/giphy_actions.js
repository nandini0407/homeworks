import * as APIUtil from '../util/api_util';

export const RECEIVE_SEARCH_GIPHYS = "RECEIVE_SEARCH_GIPHYS";

// async actions
export const fetchSearchGiphys = (searchTerm) => {
  return (dispatch) => {
    return (
      APIUtil.fetchSearchGiphys(searchTerm)
      .then((giphys) => dispatch(receiveSearchGiphys(giphys.data)))
    );
  };
};

window.fetchSearchGiphys = fetchSearchGiphys;

// sync actions

export const receiveSearchGiphys = (giphys) => {
  return {
    type: RECEIVE_SEARCH_GIPHYS,
    giphys
  };
};

window.receiveSearchGiphys = receiveSearchGiphys;
