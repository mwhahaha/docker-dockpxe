docker build -t mwhahaha/dockpxe .
docker run --privileged -ti -v ~/dockpxe/configs:/configs mwhahaha/dockpxe /bin/bash
