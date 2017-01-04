import React from 'react';

const GiphysIndexItem = ({ giphyUrl }) => {
  return (
    <li className="giphy-li">
      <img src={giphyUrl} />
    </li>
  );
};

export default GiphysIndexItem;
