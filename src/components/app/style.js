export default {
  app: {
    height: "100%"
  },
  topContainer: {
    boxSizing: "border-box",
    fontSize: "24px",
    color: "#FFFFFF",
    height: "80px",
    padding: "0 20px",
    display: "flex",
    justifyContent: "flex-start",
    alignItems: "center",
    position: "relative",
    zIndex: 2,
    backgroundColor: "#00BCD4",
    boxShadow: "0 2px 2px #999999"
  },
  bottomContainer: {
    height: "calc(100% - 80px)",
    position: "relative",
    zIndex: 1
  }
}
