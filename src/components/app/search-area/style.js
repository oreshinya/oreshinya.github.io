export default {
  searchArea: {
    height: "100%",
    position: "relative"
  },
  field: {
    position: "absolute",
    top: 0,
    left: 0,
    width: `${window.innerWidth}px`,
    height: `${window.innerHeight - 80}px`
  },
  loupe: {
    position: "absolute",
    top: 0,
    left: 0,
    boxSizing: "border-box",
    width: "120px",
    height: "120px",
    borderRadius: "60px",
    border: "4px solid #999999",
    overflow: "hidden"
  }
}
