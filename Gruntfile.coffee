module.exports = (grunt) ->
  broccoli = require 'broccoli'

  grunt.loadNpmTasks 'grunt-jasmine-node'
  grunt.loadNpmTasks 'grunt-broccoli-build'
  grunt.loadNpmTasks 'grunt-contrib-clean'

  testBuildFolder = 'test_build'

  grunt.initConfig
    jasmine_node:
      all: [testBuildFolder]

    broccoli_build:
      default:
        env: 'production'

      test:
        dest: testBuildFolder

    clean:
      tmp: ['tmp']
      testBuild: [testBuildFolder]

  grunt.registerTask 'test', [
    'broccoli_build:test'
    'jasmine_node'
    'clean'
  ]

  grunt.registerTask 'build', [
    'broccoli_build:default'
    'clean'
  ]

  grunt.registerTask 'default', ['test']
