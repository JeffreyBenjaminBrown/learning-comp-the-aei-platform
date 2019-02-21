A trick to quickly edit a Docker-locked file from the host system:
  https://stackoverflow.com/a/26915343

docker build -f Dockerfile -t                           \
  jeffreybbrown/matchups-aei .                          \
  | tee logs/"build-log.`date`.txt"

sudo docker run --name matchups -it -v /home/jeff/comp-aei:/mnt    \
  -p 8889:8888 -d -h 127.0.0.1                                     \
  jeffreybbrown/matchups-aei
