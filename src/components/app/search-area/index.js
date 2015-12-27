import React, {Component} from "react";
import Radium from "radium";
import Oreshinya from "./oreshinya";
import style from "./style";

class SearchArea extends Component {
  constructor(props) {
    super(props);
    this.state = {
      loupeX: 0,
      loupeY: 0
    };
  }
  render() {
    return (
      <div style={style.searchArea} onMouseMove={this._onMouseMove.bind(this)}>
        <div style={this._getLoupeStyle()}>
          <div style={this._getFieldStyle()}>
            <Oreshinya />
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
}

export default Radium(SearchArea)
