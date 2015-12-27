import React, {Component} from "react";
import Radium from "radium";
import style from "./style";

@Radium
export default class Oreshinya extends Component {
  render() {
    return (
      <div style={style.oreshinya}>
        <div style={style.imageContainer}>
          <a style={style.imageLink} href="https://twitter.com/oreshinya" target="_blank">
            <img src="./images/github.png" />
          </a>
          <a style={style.imageLink} href="https://github.com/oreshinya" target="_blank">
            <img src="./images/twitter.png" />
          </a>
        </div>
        <div style={style.born} />
      </div>
    );
  }
}
