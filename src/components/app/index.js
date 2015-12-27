import React, {Component} from "react";
import SearchArea from "./search-area";
import style from "./style";

export default class App extends Component {
  render() {
    return (
      <div style={style.app}>
        <div style={style.topContainer}>
          Where's oreshinya?
        </div>
        <div style={style.bottomContainer}>
          <SearchArea />
        </div>
      </div>
    );
  }
}
