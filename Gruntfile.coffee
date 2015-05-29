module.exports = (grunt)->

  ###############################################################
  # Constants
  ###############################################################

  SRC_COFFEE_DIR = 'coffee'
  TARGET_JS_DIR  = 'js'

  SRC_CSS_DIR    = 'css'

  INDEX_HTML     = 'index.html'
  VIEWS_DIR      = 'views'

  GRUNTFILE      = 'Gruntfile.coffee'

  ###############################################################
  # Config
  ###############################################################

  grunt.initConfig

    clean:
      js:
        src: TARGET_JS_DIR

    coffeelint:
      app: "#{SRC_COFFEE_DIR}/**/*.coffee"
      Gruntfile: [GRUNTFILE]

    coffee:
      app:
        expand: true
        flatten: false
        cwd: SRC_COFFEE_DIR
        src: '**/*.coffee'
        dest: TARGET_JS_DIR
        ext: '.js'

    connect:
      server:
        options:
          base: './'

    watch:
      coffee:
        cwd: SRC_COFFEE_DIR
        files: '**/*.coffee'
        tasks: ['buildcoffee']

      Gruntfile:
        files: GRUNTFILE
        tasks: ['coffeelint:Gruntfile']

      assets:
        files: [
          "#{TARGET_JS_DIR}/**/*.js",
          "#{SRC_CSS_DIR}/**/*.css",
          INDEX_HTML,
          "#{VIEWS_DIR}/**/*.html"
        ]
        tasks: []
        options:
          livereload: true

  ##############################################################
  # Dependencies
  ###############################################################
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-coffeelint')
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-connect')
  grunt.loadNpmTasks('grunt-contrib-watch')

  ###############################################################
  # Alias tasks
  ###############################################################

  grunt.registerTask('buildcoffee', ['coffeelint:app','coffee'])
  grunt.registerTask('build', ['coffeelint::Gruntfile', 'buildcoffee'])
  grunt.registerTask('watcher', ['connect', 'watch'])
  grunt.registerTask('dist', ['build'])

  grunt.registerTask('default', ['clean','build'])
