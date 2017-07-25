FROM geerlingguy/docker-ubuntu1604-ansible

# Install dependencies.
RUN apt-get update \
    && apt-get install -y --no-install-recommends curl tzdata
