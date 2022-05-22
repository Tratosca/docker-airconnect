<h1 align="center">Welcome to docker-airconnect 👋</h1>
<p>
  <img alt="Version" src="https://img.shields.io/badge/version-1.0.0-blue.svg?cacheSeconds=2592000" />
</p>

A simple and lightweight Docker image based on Alpine Linux to stream AirPlay to Sonos effortlessly.
Based on [@philippe44](https://github.com/philippe44/airconnect)'s fantastic work.

## The easy way

```sh
docker run -d --net=host cinammonpourpre/airconnect
```

Remove <code>-d</code> to run in background

<code>--net=host</code> is required to run in *__true__* bridged mode (allowing the container to be in the same IP subnet than the Docker host, your Sonos system and your AirPlay sender; at least on most configurations)

## Using environment variables
You can pass some facultative environment variables to this docker container:

- <code>CODEC=mp3:bitrate|flc:quality|wav</code> (flc is for FLAC, <code>bitrate</code> and <code>quality</code> must be specified if using FLAC or MP3). Default: <code>flc</code>

- <code>METADATA=1|0</code> either if you wish to broadcast songs metadata to Sonos (1) or not (0). Default: <code>1</code>

- <code>LATENCY=integer:integer</code> in the format of <code>number:number</code> where the firs is the AirPlay latency and the second is the Sonos latency. Increase value of the first one if your network is bad. The second is quite failsafe actually. Default <code>500:500</code>)

- <code>ARTWORK=1|0</code> either if you wish to broadcast the artwork pic to Sonos (1) or not (0). Default: <code>1</code>

- <code>NAME=your_fantastic_desired_name</code> for customizing the name of the AirPlay device. Only works if you build the image with your own conf file in <code>/etc</code> that contains only a single Sonos device. Default: <code>Sonos+</code>

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
    image: cinammonpourpre/airconnect
    environment:
    - CODEC='wav'
```

Next, run it daemonized:

```sh
docker-compose up -d
```

## Many thanks to: 
[@1activegeek](https://github.com/1activegeek) for his multiplatform build technique

[@miegl](https://github.com/miegl) for his env variable passing shell script

[@philippe44](https://github.com/philippe44) most importantly for Airconnect !

[@kefranabg](https://github.com/kefranabg) for this [readme-md-generator](https://github.com/kefranabg/readme-md-generator)



## Author
👤 **François Brille**

* Website: francois-brille.fr
* Github: [@ItsPops](https://github.com/ItsPops)