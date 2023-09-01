# stingless
To build the image \
```sudo docker build . -t stingless-beta``` \
To run it
```
sudo docker run -it --rm   \
--privileged   \
-v /lib/modules:/lib/modules:ro   \
-v /usr/src:/usr/src:ro   \
-v /etc/localtime:/etc/localtime:ro \
--workdir /src/stingless/bcc/tools \
stingless-beta
```

