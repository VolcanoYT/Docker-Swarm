# Docker Swarm

Runs Swarm (analyze seismic by usgs), and includes obs-studio and vnc programs for remote monitoring.

![Screenshot](show_me.jpg)

## How Use

Use docker to run it (VolcanoYT Repo requires a password, please ask me first)

```bash
docker run --rm -it  -p 5901:5901/tcp -p 6080:6080/tcp repo.volcanoyt.com/docker-swarm:last
```

or please build it manually so you can use it without a password :)

```bash
docker build -t "docker-swarm:last" -f Dockerfile .
```

## Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

```bash
docker build -t "repo.volcanoyt.com/docker-swarm:last" -f Dockerfile .
docker push repo.volcanoyt.com/docker-swarm:last
```

## License
[MIT](https://choosealicense.com/licenses/mit/)