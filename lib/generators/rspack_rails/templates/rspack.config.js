const { RspackManifestPlugin } = require("rspack-manifest-plugin");
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
  plugins: [
    new RspackManifestPlugin({
      fileName: "manifest.json",
      publicPath: "/packs/",
      writeToFileEmit: true,
    }),
  ],
};
