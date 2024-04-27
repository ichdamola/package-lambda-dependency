docker build -t amazonlinux_image . 
docker run -it -v test_volume:/usr/src/data --name amazonlinux_container amazonlinux_image /bin/bash
docker cp amazonlinux_container:/usr/src/data/modules.zip .
