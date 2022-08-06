const webpack = require("webpack");
const HtmlWebpackPlugin = require("html-webpack-plugin");

/**
 * @type {import('webpack').Configuration}
 */
module.exports = {
  mode: process.env.NODE_ENV,

  output: {
    clean: true,
  },

  devtool: "source-map",

  plugins: [
    process.env.NODE_ENV === "production"
      ? new webpack.DefinePlugin({
          // 1. Use `eval` to make it indeterminate to prevent it from being minified
          // 2. Replace `__ENV__` with `__RUNTIME_ENV__` will help us distinguish and ignore source-map
          "__ENV__.NAME": `eval('"__RUNTIME_ENV__.NAME"')`,
        })
      : new webpack.DefinePlugin({
          "__ENV__.NAME": JSON.stringify(process.env.NAME),
        }),
    new HtmlWebpackPlugin({
      templateContent: `<div id="app"></div>`,
    }),
  ],
};
