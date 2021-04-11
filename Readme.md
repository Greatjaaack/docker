Docker
Docker image to run samtools whith libdeflate in Ubuntu 18.04

The image contains a full install of samtools, including all plugins and libdeflate
.
In detail, the image is set up with:

Ubuntu 18.04
samtools 1.12

$ docker build -t image_1 .

$ docker run -it image_1 /bin/bash