const path = require('path');

module.exports = {
  context: __dirname,
  entry: './frontend/echo_syndicate.jsx',
  output: {
    path: path.join(__dirname, 'app', 'assets', 'javascripts'),
    filename: 'bundle.js'
  },
  resolve: {
    extensions: ['', '.js', '.jsx']
  },
  module: {
    loaders: [
      {
        test: /\.jsx?$/,
        exclude: /(node_modules|bower_components)/,
        loader: "babel",
        query: {
          presets: ['babel-preset-react', 'babel-preset-es2015']
        }
      }
    ]
  },
  devtool: 'source-maps'
};
