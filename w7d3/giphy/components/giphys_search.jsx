import React, { Component } from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: ""
    };

    this.handleSubmit = this.handleSubmit.bind(this);
    this.handleChange = this.handleChange.bind(this);
  }

  handleSubmit (e) {
    e.preventDefault();
    let searchTerm = this.state.searchTerm.split(" ").join('+');
    this.props.fetchSearchGiphys(searchTerm)
    .then(this.setState({ searchTerm: "" }));
  }

  handleChange (e) {
    e.preventDefault();
    this.setState({ searchTerm: e.target.value });
  }

  render () {
    return (
      <div>
        <form className="search-bar">
          <input
            type="text"
            value={this.state.searchTerm}
            onChange={this.handleChange}
            />
          <button
            type="submit"
            value="Search Giphy"
            onClick={this.handleSubmit}
          >Search Giphys</button>
        </form>
        <GiphysIndex
          giphys={this.props.giphys}
          />
      </div>
    );
  }
}

export default GiphysSearch;
