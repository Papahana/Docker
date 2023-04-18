Install and setup Docker on Windows
===============
Create a Python Dev Environment with Docker and VS Code

**Installing Docker**

Use this link to install Docker Desktop

.. code-block:: bash

    https://www.docker.com/get-started/

You'll need to install the Linux kernel update package

.. code-block:: bash

    https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi

**Installing Ubuntu Terminal**

Install the Ubuntu 20.04 LTS from Microsoft Store and setup your user and password

**Installing Git**

It makes working with docker really easier

.. code-block:: bash

    https://git-scm.com/downloads

**Installing Visual Studio Code**

Visual Studio is an Integrated Development Environment, also known as an IDE. Visual Studio Code is a code editor. A developer can easily edit their code

.. code-block:: bash

    https://code.visualstudio.com/

This extensions are necessary for using docker with vs code:

* Docker
* Dev Containers

Docker Commands
===============

.. code-block:: bash

    docker run -di --name <name_container> <name_image> # create a container
    docker stop <name_container>
    docker start <name_container>
    docker exec -it <name_container> bash # open a container that's already running
    
    # For Flask application
    docker build -t <name_image>:latest .
    docker run -d --name <name_container> -p 80:80 <name_image> # create a container for webdev

    docker ps  # show running containers
    docker ps -a  # show all the containers
    docker images  # show your images

    docker rm  # remove a container
    docker rmi  # remove an existing image
    
    docker build .  # Build the image from a Dockerfile
    docker image tag old_name:old_tag new_name:new_tag  # Change the name:tag. This second image depends on the original one

Linux System Commands
===============

.. code-block:: bash
    
    free -h
    vmstat -s -S M
    
    du -sh directorio/  # Less recommended -> df –ht /home
    du -sh */  # Less recommended -> df -h
    
    adduser <name>  # Deactivate root login in "sudo nano /etc/ssh/sshd_config" with "PermitRootLogin no". Then "/etc/init.d/ssh restart"
    sudo cat /etc/passwd  # This return the list of users
    su -  # Login in root user

Install Docker on Linux
===============

Uninstall any such older versions before attempting to install a new version

.. code-block:: bash

    # Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages
    sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
    
    # To delete all images, containers, and volumes
    sudo rm -rf /var/lib/docker
    sudo rm -rf /var/lib/containerd
    
    # Uninstall any such older versions before attempting to install a new version
    sudo apt-get remove docker docker-engine docker.io containerd runc
    
Install using the apt repository

.. code-block:: bash

    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg
    
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    
    echo "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    sudo docker run hello-world
    
