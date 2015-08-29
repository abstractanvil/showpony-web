module.exports = (grunt) ->

  grunt.initConfig
    clean: ["./dist"]

    bower:
      install:
        options:
          targetDir: './dist'

    jade:
      compile:
        options:
          pretty: true
          #data:
          #  debug: false
        files:
          "./dist/index.html": ["./src/app/index.jade"]

    stylus:
      compile:
        files:
          './dist/styles/style.css': ['./src/app/styles/*.styl']

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-stylus'

  grunt.registerTask 'dist', ['clean', 'bower', 'stylus', 'jade']
  grunt.registerTask 'default', ['dist']
