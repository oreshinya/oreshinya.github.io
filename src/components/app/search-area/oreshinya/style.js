import Radium from "radium";

const walk = Radium.keyframes({
  "0%": {
    backgroundPosition: "-32px 0"
  },
  "25%": {
    backgroundPosition: "-32px 0"
  },
  "50%": {
    backgroundPosition: "0 0"
  },
  "75%": {
    backgroundPosition: "-32px 0"
  },
  "100%": {
    backgroundPosition: "-64px 0"
  }
});

export default {
  born: {
    width: "32px",
    height: "32px",
    backgroundImage: "url(./images/hone.png)",
    backgroundSize: "96px 128px",
    animation: `${walk} 1s step-start 0s infinite`
  }
}
