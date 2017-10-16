module.exports = {
  entry: './src/github-repo-buttons.coffee',
  output: {
    path: __dirname + '/dist',
    filename: 'github-repo-buttons.js'
  },
  module: {
    rules: [
      {
        test: /\.coffee$/,
        use: ['buble-loader', 'coffee-loader'],
      },
      {
        test: /\.scss$/,
        use: ['style-loader', 'css-loader', 'sass-loader'],
      },
      {
        test: /\.js$/,
        use: ['buble-loader'],
      },
      {
        test: /\.svg$/,
        loader: 'svg-inline-loader',
      },
    ]
  }
}
