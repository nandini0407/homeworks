import React, { Component } from 'react';
import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
  return (
    <ul>
      { giphys.map((giphy, idx) =>
        <GiphysIndexItem
          key={idx}
          giphyUrl={giphy.images.fixed_height.url}
        />
      )}
    </ul>
  );
};

export default GiphysIndex;
