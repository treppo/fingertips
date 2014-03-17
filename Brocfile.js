module.exports = function (broccoli) {
  var filterCoffeeScript = require('broccoli-coffee');
  var filterES6Modules = require('broccoli-es6-module-filter');
  var pickFiles = require('broccoli-static-compiler');
  var env = require('broccoli-env').getEnv();

  var compileCoffeeScript = function(treeName) {
    var tree = pickFiles(broccoli.makeTree(treeName), {
      srcDir: '/',
      destDir: treeName
    });

    var filteredTree = filterCoffeeScript(tree, {
      bare: true
    })

    return filteredTree
  }

  var scriptTrees = [compileCoffeeScript('src')];
  var result = [];

  if (env === 'development') {
    result.push(broccoli.makeTree('public'));
  } else {
    scriptTrees.push(compileCoffeeScript('test'));
  }

  var transpiledScriptTree = filterES6Modules(new broccoli.MergedTree(scriptTrees), {
    moduleType: 'cjs'
  });
  result.push(transpiledScriptTree);

  return result
}
