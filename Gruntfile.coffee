rimraf = require 'rimraf'

module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-broccoli'
  grunt.loadNpmTasks 'grunt-jasmine-node'

  grunt.initConfig
    jasmine_node:
      all: ['build/']

  buildFolder = 'build'
  tempFolder = 'tmp'

  grunt.registerTask 'cleanupBuild', 'Cleans up after broccoli build', ->
    done = @async()
    rimraf buildFolder, ->
      rimraf tempFolder, done

  grunt.registerTask 'test', [
    "broccoli:build:#{buildFolder}"
    'jasmine_node'
    'cleanupBuild'
  ]
  grunt.registerTask 'default', ['test']
