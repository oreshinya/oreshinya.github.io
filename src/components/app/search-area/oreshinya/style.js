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

const jump = Radium.keyframes({
  "0%": {
    top: 0
  },
  "50%": {
    top: "-20px"
  },
  "100%": {
    top: 0
  }
});

const jumpBlock = Radium.keyframes({
  "0%": {
    top: 0,
    opacity: 0
  },
  "50%": {
    top: "-20px",
    opacity: 1
  },
  "100%": {
    top: 0,
    opacity: 1
  }
});

export default {
  oreshinya: {
    width: "60px",
    height: "60px",
    display: "flex",
    justifyContent: "center",
    alignItems: "center",
    flexDirection: "column"
  },
  imageContainer: {
    width: "60px",
    display: "flex",
    justifyContent: "space-between",
    alignItems: "center",
    position: "relative",
    opacity: 0,
    pointerEvents: "none"
  },
  clickedImageContainer: {
    animation: `${jumpBlock} 0.1s linear 0.1s 1`,
    animationFillMode: "forwards",
    pointerEvents: "auto"
  },
  imageLink: {
    display: "block"
  },
  born: {
    position: "relative",
    width: "32px",
    height: "32px",
    backgroundImage: "url(./images/hone.png)",
    backgroundSize: "96px 128px",
    animation: `${walk} 1s step-start 0s infinite`
  },
  clickedBorn: {
    animation: `${jump} 0.1s linear 0s 1, ${walk} 1s step-start 0s infinite`
  }
}
