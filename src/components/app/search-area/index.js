import React, {Component} from "react";
import style from "./style";

export default class SearchArea extends Component {
  render() {
    return (
      <div style={style.searchArea}>
        <div style={style.loupe}>
          <div style={style.field}>
          </div>
        </div>
      </div>
    );
  }
}
