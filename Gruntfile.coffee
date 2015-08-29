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

    watch:
      jade:
        files: ['./src/app/**/*.jade']
        tasks: ['jade']

      sty:
        files: ['./src/app/styles/*.styl']
        tasks: ['stylus']

  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-bower-task'
  grunt.loadNpmTasks 'grunt-contrib-stylus'
  grunt.loadNpmTasks 'grunt-contrib-watch'

  grunt.registerTask 'dist', ['clean', 'bower', 'stylus', 'jade']
  grunt.registerTask 'default', ['dist']
