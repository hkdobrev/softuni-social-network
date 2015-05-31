module.exports = (grunt)->

  ###############################################################
  # Constants
  ###############################################################

  SRC_COFFEE_DIR     = 'app'
  TARGET_JS_DIR      = 'js'
  TARGET_JS_MAPS_DIR = "#{TARGET_JS_DIR}/maps"

  SRC_CSS_DIR        = 'css'

  INDEX_HTML         = 'index.html'
  VIEWS_DIR          = 'views'
  INCLUDES_DIR       = 'includes'

  GRUNTFILE          = 'Gruntfile.coffee'

  ###############################################################
  # Config
  ###############################################################

  modRewrite = require 'connect-modrewrite'

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
        options:
          sourceMap: true
          sourceMapDir: TARGET_JS_MAPS_DIR

    connect:
      server:
        options:
          port: 8000
          livereload: 35729
          hostname: 'localhost'
          base: './'
          middleware: (connect, options) ->
            middlewares = []

            # Matches everything that does not contain a '.' (period)
            middlewares.push modRewrite(['^[^\\.]*$ /index.html [L]'])
            results = (connect.static base for base in options.base)

            [].push.apply middlewares, results

            middlewares

    watch:
      coffee:
        cwd: SRC_COFFEE_DIR
        files: '**/*.coffee'
        tasks: ['buildcoffee']
        options:
          livereload: true

      Gruntfile:
        files: GRUNTFILE
        tasks: ['coffeelint:Gruntfile']

      assets:
        files: [
          "#{TARGET_JS_DIR}/**/*.js"
          "#{SRC_CSS_DIR}/**/*.css"
          INDEX_HTML
          "#{VIEWS_DIR}/**/*.html"
          "#{INCLUDES_DIR}/**/*.html"
        ]
        tasks: ['noop']
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

  grunt.registerTask('noop', [])

  grunt.registerTask('default', ['clean','build'])
