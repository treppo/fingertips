gulp = require 'gulp'
coffee = require 'gulp-coffee'
es6ModuleTranspiler = require "gulp-es6-module-transpiler"
jasmine = require 'gulp-jasmine'
clean = require 'gulp-clean'
serve = require 'gulp-serve'
browserify = require 'browserify'
source = require 'vinyl-source-stream'

compile = (src, dest) -> ->
  gulp.src src
    .pipe coffee bare: true
    .pipe es6ModuleTranspiler type: 'cjs'
    .pipe gulp.dest dest

cleanTmp = ->
  gulp.src 'tmp', read: false
    .pipe clean()

gulp.task 'scripts', compile './src/*.coffee', './tmp/src'

gulp.task 'tests', compile './test/unit/*.coffee', './tmp/test/unit'

gulp.task 'jasmine', ['scripts', 'tests'], ->
  gulp.src './tmp/test/unit/*.js'
    .pipe jasmine()

gulp.task 'test', ['jasmine'], cleanTmp

gulp.task 'browserify', ['scripts'], ->
  browserify './tmp/src/app.js'
    .bundle standalone: 'app'
    .pipe source 'app.js'
    .pipe gulp.dest './build'

gulp.task 'serve', serve ['build', 'public']
