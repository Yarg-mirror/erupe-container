# Erupe Container

A Contenerized version of the Monster Hunter Frontier server emulator [Erupe](https://github.com/ZeruLight/Erupe).

Work with Podman and Docker under Windows and Linux. But only for a local installation **for now**.

## How to use

### Podman

On Windows follow the installation guide of [Podman Desktop](https://podman-desktop.io/).

On Linux follow the [installation instructions](https://podman.io/getting-started/installation.html).

Then open a terminal and run theses commands:
```bash
# CD into both directories and build the container images
# for the database
podman build -t pgerupe .

# for the server
podman build -t srverupe .

# Create the network to allow both container to talk togethers
podman create network erupe

# Start the database container
podman run -d --net erupe --restart=always --name pgerupe -p 127.0.0.1:5432:5432 localhost/pgerupe

# Start the server container
podman run -d --net erupe --restart=always --name srverupe -p 53310:53310 -p 53312:53312 -p 54001:54001 -p 54002:54002 -p 54003:54003 -p 54004:54004 -p 54005:54005 -p 54006:54006 -p 54007:54007 -p 54008:54008 -v <system path>:/app/bin localhost/srverupe
```

Before starting the server container, think about replacing *system path* by a path from your system where you will have to set the directories events, quests and scenarios containing the differents quests that can be taken during the game.

### Docker

On Windows follow the installation guide of [Docker Desktop](https://www.docker.com/products/docker-desktop/).

On Linux follow the [installation instructions](https://docs.docker.com/engine/install/).

Then open a terminal and run theses commands:
```bash
# CD into both directories and build the container images
# for the database
docker build -t pgerupe .

# for the server
docker build -t srverupe .

# Create the network to allow both container to talk togethers
docker create network erupe

# Start the database container
docker run -d --net erupe --restart=always --name pgerupe -p 127.0.0.1:5432:5432 localhost/pgerupe

# Start the server container
docker run -d --net erupe --restart=always --name srverupe -p 53310:53310 -p 53312:53312 -p 54001:54001 -p 54002:54002 -p 54003:54003 -p 54004:54004 -p 54005:54005 -p 54006:54006 -p 54007:54007 -p 54008:54008 -v <system path>:/app/bin localhost/srverupe
```

Before starting the server container, think about replacing *system path* by a path from your system where you will have to set the directories events, quests and scenarios containing the differents quests that can be taken during the game.

---

## TODO
  * Add ENV variables to manage the Erupe config.json file.
  * Create the podman-compose et docker-compose files.
  * Drop both images on docker.io
  * Fill the Wiki

## Notes

  * Currently the password database is fixed to "azerty" and for the user/database postgres like the name of the database container **must be** pgerupe, that will change soon. 
  * The database is only accessible locally so this is not a "major" issue for now, but that mean that [MHF Save Manager](https://github.com/Chakratos/mhf-save-manager) from Chakratos still work perfectly with the previous informations.