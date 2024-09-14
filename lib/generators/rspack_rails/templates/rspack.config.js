const { RspackManifestPlugin } = require("rspack-manifest-plugin");
const path = require("path");
const { CleanWebpackPlugin } = require("clean-webpack-plugin");

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
    new CleanWebpackPlugin({
      cleanStaleWebpackAssets: true,
      cleanOnceBeforeBuildPatterns: ["**/*"],
    }),
    new RspackManifestPlugin({
      fileName: "manifest.json",
      publicPath: "/packs/",
      writeToFileEmit: true,
    }),
  ],
  resolve: {
    modules: [path.resolve(__dirname, "app/javascript"), "node_modules"],
    extensions: [".js"], // Add more extensions if needed
  },
};
