#!/bin/bash
export DISPLAY=:99
ffmpeg -framerate 10 -video_size 1920x1080 -f x11grab -i :99 -f lavfi -i anullsrc -preset veryfast -c:v libx264 -g 2 -b:v 800k -bufsize 2000k -c:a aac -b:a 48k -f flv $1