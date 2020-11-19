# Docker Swarm

Run Swarm (analyze seismic by usgs), and includes app nautilus,chromium,obs-studio,ffmpeg,vlc for remote monitoring (base alpine)

![Screenshot](show_me.jpg)

## How to Use!

Use docker to run it (VolcanoYT Repo requires a password, please ask me first)

```bash
docker run --rm -it  -p 5901:5901/tcp -p 6080:6080/tcp repo.volcanoyt.com/docker-swarm:last
```

- Web Remote: http://localhost:6080 with password "demo"

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

```bash
git clone https://github.com/volcanoyt/Docker-Swarm.git
docker build -t "repo.volcanoyt.com/docker-swarm:last" -f Dockerfile .
docker push repo.volcanoyt.com/docker-swarm:last
```

## License
[MIT](https://choosealicense.com/licenses/mit/)