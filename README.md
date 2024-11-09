<h1 align="center">Welcome to docker-airconnect 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.1-blue.svg?cacheSeconds=2592000" />
</p>

A simple and lightweight Docker image based on Alpine Linux to stream AirPlay to Sonos effortlessly.
Based on [@philippe44](https://github.com/philippe44/airconnect)'s fantastic work.

## The easy way

```sh
docker run -d --net=host cinammonpourpre/airconnect
```

Remove <code>-d</code> to run in foreground (not recommended)

<code>--net=host</code> is required to run in *__true__* bridged mode (allowing the container to be in the same IP subnet than the Docker host, your Sonos system and your AirPlay sender; at least on most configurations)

## Using environment variables
You can pass some facultative environment variables to this app:

- <code>CODEC=mp3:bitrate|flc:quality|wav</code> (flc is for FLAC). <code>bitrate</code> must be specified if using MP3). Default: <code>flc</code>

- <code>METADATA=1|0</code> either if you wish to broadcast songs metadata to Sonos (1) or not (0). Default: <code>1</code>

- <code>LATENCY=integer:integer</code> in the format of <code>number:number</code> where the firs is the AirPlay latency and the second is the Sonos latency. Increase value of the first one if your network is bad. The second is quite failsafe actually. Default <code>500:500</code>)

- <code>ARTWORK=1|0</code> either if you wish to broadcast the artwork pic to Sonos (1) or not (0). Default: <code>1</code>

- <code>NAME=your_fantastic_desired_name</code> for customizing the name of the AirPlay device. Only works if you build the image with your own conf file in <code>/etc</code> that already contains a single Sonos device. Default: <code>Sonos+</code>.

- <code>$MAXVOLUME=1..100</code> for editing the max volume of the Sonos device that can be set from your AirPlay sender device. Default: <code>100</code>

## Building the image

```sh
git clone https://github.com/ItsPops/docker-airconnect.git
cd docker-airconnect
docker build . --tag yourself/airconnect
```

## Using docker-compose

Create a <code>docker-compose.yml</code> file with this sample config: 

```sh
services:
  airconnect:
    network_mode: "host"
    container_name: airconnect
    image: cinammonpourpre/airconnect # this image doesn't exist anymore, please compile yourself
    environment:
    - CODEC='wav'
```

Run it, daemonized:

```sh
docker-compose up -d
```
## Changing the name of a Sonos receiver
### By manually editing <code>etc/airupnp.conf</code> and <code>start.sh</code>
1) Run the container once to let it detect your devices
```sh
# Image is to be pushed to Docker Hub anytime soon, because cinammonpourpre is an old Docker hub account of mine removed since
docker run -d --net=host cinammonpourpre/airconnect
```
2) Open a shell to the container
```sh
docker exec -ti airconnect sh
```
3) Generate a sample conf file that will override the default one
```sh
airupnp -i /etc/airupnp.conf
```
After a few seconds press <code>Ctrl</code>+<code>C</code> to exit and return to the container shell.

4) Edit the conf file with <code>vi</code>
```sh
vi /etc/airupnp.conf
```
5) Locate the <code>name</code> parameter and edit the value with the name you want :)

### By passing the <code>name</code> env variable (only works if a single Sonos device is detected)
1) Follow the guide below from step 1. to step 4. and add an env variable as <code>NAME=your_device_name</code> in your <code>docker-compose.yml</code> file or in the command.

## To do:

☐ Multi platform Docker image building (current image not tested on x86_64)

☐ Adding AirCast to allow streaming to Chromecast

☐ Adding more env variables to edit things 

☐ Building from latest AirConnect sources instead of precompiled binaries


## Many thanks to: 
[@1activegeek](https://github.com/1activegeek) for his multiplatform build technique

[@miegl](https://github.com/miegl) for his env variable passing shell script

[@philippe44](https://github.com/philippe44) most importantly for Airconnect !

[@kefranabg](https://github.com/kefranabg) for this [readme-md-generator](https://github.com/kefranabg/readme-md-generator)
