gulp = require 'gulp'
coffee = require 'gulp-coffee'
es6ModuleTranspiler = require "gulp-es6-module-transpiler"
jasmine = require 'gulp-jasmine'
clean = require 'gulp-clean'
serve = require 'gulp-serve'
browserify = require 'browserify'
source = require 'vinyl-source-stream'
sass = require 'gulp-ruby-sass'
shell = require 'gulp-shell'

compile = (src, dest) -> ->
  gulp.src src
    .pipe coffee bare: true
    .pipe es6ModuleTranspiler type: 'cjs'
    .pipe gulp.dest dest

gulp.task 'clean', ->
  gulp.src 'tmp', read: false
    .pipe clean()

gulp.task 'compile-scripts', compile './src/**/*.coffee', './tmp/src'

gulp.task 'test', ['compile-scripts'], ->
  gulp.src './tmp/src/**/__tests__/*test.js'
    .pipe jasmine()

gulp.task 'bundle-scripts', ['compile-scripts'], ->
  browserify './tmp/src/app.js'
    .bundle standalone: 'app'
    .pipe source 'app.js'
    .pipe gulp.dest './tmp'

gulp.task 'compile-styles', ->
  gulp.src './style/app.sass'
    .pipe sass
      sourcemap: true
      quiet: true
    .pipe gulp.dest './tmp'

gulp.task 'copy-public', ->
  gulp.src './public/*'
    .pipe gulp.dest './tmp'

gulp.task 'dev', ['test', 'bundle-scripts', 'compile-styles', 'copy-public']

gulp.task 'watch', ['dev'], ->
  serve('tmp')()
  gulp.watch 'style/**/*', ['compile-styles']
  gulp.watch 'public/**/*', ['copy-public']
  gulp.watch ['src/**/*', 'test/**/*'], ['test', 'bundle-scripts']

gulp.task 'dist', ['bundle-scripts', 'compile-styles', 'copy-public'], ->
  gulp.src ['./tmp/*.js', './tmp/*.css', './tmp/*.html']
    .pipe gulp.dest './dist'

gitPublish = 'git add . && git commit -m "Updated version" && git push origin gh-pages'

gulp.task 'deploy', ['dist'], shell.task gitPublish, cwd: 'dist'
