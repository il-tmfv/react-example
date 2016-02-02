var gulp = require('gulp');
var coffee = require('gulp-coffee');
var gutil = require('gulp-util');
var uglify = require('gulp-uglify');

gulp.task('make-js', function() {
    gulp.src('./src/*.coffee')
        .pipe(coffee({bare: true}).on('error', gutil.log))
        .pipe(uglify())
        .pipe(gulp.dest('./public/'));
});

gulp.task('make', ['make-js'], function(){
    gulp.watch('./src/*.coffee', ['make-js']); 
});