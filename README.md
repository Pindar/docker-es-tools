# docker-es-tools

```
docker run \
    --name es-tools \
    -e ELASTICSEARCH=$ELASTICSEARCH_ENDPOINT \
    pindar/es-tools \
    /elasticsearch-optimize-index.sh
```


```
docker run \
    --name es-tools \
    pindar/es-tools \
    /elasticsearch-remove-old-indices.sh -e "$ELASTICSEARCH_ENDPOINT" -i 3
```