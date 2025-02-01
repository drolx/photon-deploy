# Photon Geocoder Deployment

## Search

```
http://localhost:2322/api?q=amsterdam
```

*For more details on the API check the Photon [github repository](https://github.com/komoot/photon).*

## Build from git

```
```shell
git clone https://github.com/drolx/photon-deploy.git geo
```

```
### With docker-compose

```shell
docker compose build #optional
docker compose up
```

>[!NOTE]
> if you abort the download, you have to remove the volume `photon_data` before restarting the container*

## FAQ

- How do I pass arguments to the `photon.jar` ?

   *The entrypoint accepts arguments for the `photon.jar`, you can invoke it by using `docker exec`*
- Do I need to have nominatim ?

   *The container downloads the latest prebuilt search index, there is no immediate need to have nominatim installed.*

- What is Photon ?
  
   *Photon is a geocoder, check out [their website](https://photon.komoot.de/) and their [github repository](https://github.com/komoot/photon)*

