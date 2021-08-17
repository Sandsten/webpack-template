# Base app template with Webpack  

Use this as a starting point for web apps



# Webpack
Bundler which keep track of all files your project relies upon. It will then bundle these together into a small number of bundles(files) which can be loaded by the browser. It keeps track of which files depend on each other and builds a "dependency graph".
## Config file
Relies upon 6 core concepts described below.
### Entry
File which should be used as the starting point when building the dependency tree. normally `./src/index.js`. But in this case `./src/index.ts` since we are using typescript.

```javascript
module.exports = {
  entry: './path/to/my/entry/file.js',
};
```

### Output
Where to spit out the bundles it creates and how to name them.
```javascript
const path = require('path');

module.exports = {
  output: {
    path: path.resolve(__dirname, 'dist'),
    filename: 'my-first-webpack.bundle.js',
  },
};
```
### Loaders
Out of the box Webpack only understands `.js` and `.json` files. Loaders allow Webpack to use other filetypes. It can then process them and make them available to you as modules. `import * as blablabla from "this is a module";`

`rules.test` is to select which files and `rules.use` is which loader to use for processing the file.
```js
module.exports = {
  module: {
    rules: [{ 
      test: /\.txt$/, 
      use: 'raw-loader' 
    }],
  },
};
```

### Plugins
Can perform a wider range of tasks compared to loaders. 
```js
const HtmlWebpackPlugin = require('html-webpack-plugin'); //installed via npm
const webpack = require('webpack'); //to access built-in plugins

module.exports = {
  plugins: [new HtmlWebpackPlugin({ template: './src/index.html' })],
};
```
In this example `html-webpack-plugin` generates a base html file for your project automatically.

### Mode
Can be set to `production`, `development` or `none`. Activates webpack's built in optimization tailored to each use case.
```js
module.exports = {
  mode: 'production',
};
```

### Browser compatibility
Supports all browsers which are ES5-compliant.