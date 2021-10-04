const { series } = require('gulp');
var gulp = require('gulp');
gulp.task('watch', function() {
    gulp.watch([''], { 
        events: 'all',
        cwd: "/overlay/overlay2",
        depth: 1
        }).on("all", function(action, file) {
            //seen was originally out of scope, and maybe you'll want it to be again, but there's churn in the files and sometimes a layer is not ready for execution. 
            var seen = {}
            var todo = {}
            try {
            single = file.match(/[a-z0-9]{64}/)[0]
            todo[single] = 1
            const { execSync } = require('child_process');
            if(!(single in seen)){
                console.log(single)
                seen[single] = 1
                const stdout = execSync("/wrap.sh "+single);
            }}catch{}
    })
  });
