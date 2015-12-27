import React, {Component} from "react";
import Radium from "radium";
import style from "./style";

class Oreshinya extends Component {
  constructor(props) {
    super(props);
    this.state = {
      isClicked: false
    };
  }
  render() {
    return (
      <div style={style.oreshinya}>
        <div style={style.imageContainer}>
          <a style={style.imageLink} href="https://github.com/oreshinya" target="_blank">
            <img src="./images/github.png" />
          </a>
          <a style={style.imageLink} href="https://twitter.com/oreshinya" target="_blank">
            <img src="./images/twitter.png" />
          </a>
        </div>
        <div style={this._getBornStyle()} onClick={this._onBornClick.bind(this)} />
      </div>
    );
  }
  _onBornClick() {
    if (this.state.isClicked) return;
    this.setState({isClicked: true});
  }
  _getBornStyle() {
    var styles = [style.born];
    if (this.state.isClicked) {
      styles.push(style.clickedBorn);
    }
    return styles;
  }
}

export default Radium(Oreshinya)
