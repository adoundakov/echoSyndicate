const path = require('path');
var WatchLiveReloadPlugin = require('webpack-watch-livereload-plugin');
//de;ete WatchLiveReloadPlugin if heroku is causing a problem.

module.exports = {
  context: __dirname,
  entry: './frontend/echo.jsx',
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
  devtool: 'source-maps',
  //Delete the plugins below if heroku is causing a problem
  plugins: [
        new WatchLiveReloadPlugin({
            files: [
                './**/bundle.js',
                './app/assets/stylesheets/*.scss'
            ]
        }),
    ]
};
