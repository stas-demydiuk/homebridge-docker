# Docker container for homebridge

## Usage

Please link your homebridge config.json file to /root/.homebridge/config.json

```
docker run --net=host -p 5353:5353 -p 51826:51826 -v "/path/to/config.json:/root/.homebridge/config.json" demydiuk/homebridge
```

### config.json example

```
{
    "bridge": {
        "name": "Homebridge",
        "username": "CC:22:3D:E3:CE:31",
        "port": 51826,
        "pin": "031-45-154"
    },
    
    "description": "This is an example configuration. You can use this as a template for creating your own configuration file containing devices you actually own.",

    "accessories": [
        
    ],

    "platforms": [
        
    ]
}
```

### docker-compose.yml example

```
version: '2'
services:
  homebridge:
    image: demydiuk/homebridge
    environment:
      HOMEBRIDGE_PLUGINS: ''
    ports:
      - '5353:5353'
      - '51826:51826'
    volumes:
      - './config.json:/root/.homebridge/config.json'
    network_mode: 'host'
```

