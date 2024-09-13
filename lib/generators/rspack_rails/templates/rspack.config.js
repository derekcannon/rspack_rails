const path = require("path");

module.exports = {
  mode: process.env.NODE_ENV || "development",
  entry: {
    application: "./app/javascript/packs/application.js",
  },
  output: {
    filename: "[name]-[contenthash].js",
    path: path.resolve(__dirname, "public", "packs"),
    publicPath: "/packs/",
  },
  // Additional configurations...
};
