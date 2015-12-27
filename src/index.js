import React from "react";
import ReactDOM from "react-dom";
import App from "./components/app";

window.addEventListener("load", () => {
  const appContainer = document.querySelector("#app");
  ReactDOM.render(<App />, appContainer);
});
