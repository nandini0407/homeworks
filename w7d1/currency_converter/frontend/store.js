import { createStore } from 'redux';
import reducer from "./reducer.js";

window.reducer = reducer;

const store = createStore(reducer);

export default store;
