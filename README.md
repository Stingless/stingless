![image](https://github.com/Stingless/stingless/assets/83643646/0f9c8cb0-960e-436f-9001-12e8d330886a)

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

