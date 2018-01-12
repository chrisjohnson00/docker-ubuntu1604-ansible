FROM geerlingguy/docker-ubuntu1604-ansible

# Install dependencies for curl, wget and tzdata
RUN apt-get update && \
    apt-get install -y --no-install-recommends curl tzdata wget && \
    rm -Rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    apt-get clean


# Install dependencies for molecule
RUN apt-get update && \
    apt-get install -y --no-install-recommends python-pip libssl-dev python-dev gcc && \
    rm -Rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    apt-get clean && \
    pip install -U pip requests

# Upgrade all packages
RUN apt-get update && \
    apt-get upgrade -y && \
    rm -Rf /var/lib/apt/lists/* && \
    rm -Rf /usr/share/doc && \
    rm -Rf /usr/share/man && \
    apt-get clean

# Install molecule
RUN pip install -U molecule

# Install dependencies for Ansible EC2 modules
RUN pip install -U boto boto3
