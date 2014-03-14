module.exports = function (broccoli) {
  var filterCoffeeScript = require('broccoli-coffee')
  var filterES6Modules = require('broccoli-es6-module-filter')
  var pickFiles = require('broccoli-static-compiler')

  var compileCoffeeScript = function(treeName) {
    var tree = pickFiles(broccoli.makeTree(treeName), {
      srcDir: '/',
      destDir: treeName
    });

    tree = filterCoffeeScript(tree, {
      bare: true
    })

    return tree
  }

  var srcTree = compileCoffeeScript('src');

  var testTree = compileCoffeeScript('test')

  var sourceTrees = [srcTree, testTree]

  var mergedTrees = new broccoli.MergedTree(sourceTrees)

  var resultTree = filterES6Modules(mergedTrees, {
    moduleType: 'cjs'
  });

  return [resultTree]
}
