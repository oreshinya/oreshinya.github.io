import React, {Component} from "react";
import Radium from "radium";
import Oreshinya from "./oreshinya";
import style from "./style";

@Radium
export default class SearchArea extends Component {
  constructor(props) {
    super(props);
    this.state = {
      loupeX: Math.round(Math.random() * (window.innerWidth - 120)),
      loupeY: Math.round(Math.random() * (window.innerHeight - 200)),
      oreshinyaX: Math.round(Math.random() * (window.innerWidth - 60)),
      oreshinyaY: Math.round(Math.random() * (window.innerHeight - 140))
    };
  }
  render() {
    return (
      <div style={style.searchArea} onMouseMove={this._onMouseMove.bind(this)}>
        <div style={this._getLoupeStyle()}>
          <div style={this._getFieldStyle()}>
            <div style={this._oreshinyaContainerStyle()}>
              <Oreshinya />
            </div>
          </div>
        </div>
      </div>
    );
  }
  _onMouseMove(e) {
    const {clientX, clientY} = e;
    const loupeX = clientX - 60;
    const loupeY = clientY - 80 - 60;
    if (loupeY <= -60) {
      return;
    }
    this.setState({loupeX, loupeY});
  }
  _getLoupeStyle() {
    return [
      style.loupe,
      {top: `${this.state.loupeY}px`, left: `${this.state.loupeX}px`}
    ];
  }
  _getFieldStyle() {
    return [
      style.field,
      {top: `${-1 * this.state.loupeY}px`, left: `${-1 * this.state.loupeX}px`}
    ];
  }
  _oreshinyaContainerStyle() {
    return {
      marginTop: `${this.state.oreshinyaY}px`,
      marginLeft: `${this.state.oreshinyaX}px`
    }
  }
}
