This image contains the example from the angular page using typescript and
nginx as HTTP server.
https://angular.io/docs/js/latest/quickstart.html

###Usage:

    docker pull hensansi/angular2
    docker run -d -p 8080:80 --name frontend -v /path/to/angular/folder/:/var/www/angular hensansi/angular2

