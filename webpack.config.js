module.exports = {
  module: {
    loaders: [
      {
        test: /\.ls/,
        loader: 'livescript-loader'
      }
    ]
  },
  resolve: {
    extensions: ['', '.js', '.ls']
  }
};
