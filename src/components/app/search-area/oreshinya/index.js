import React, {Component} from "react";
import Radium from "radium";
import style from "./style";

@Radium
export default class Oreshinya extends Component {
  render() {
    return (
      <div>
        <div style={style.born} />
      </div>
    );
  }
}
