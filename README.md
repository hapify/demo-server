# Sandbox server

Simple server for GUI playground

## Docker

### Build this image

```bash
docker build . -t hpf-sandbox-server
```

### Run this image

```bash
docker run --rm \
       -p 4800:4800 \
       -e HPF_KEY=XXXXXXXXXXXXXXXXXXXXX \
       -e HPF_PROJECT=XXXXXXXXXXXXXXXXXXXXX \
       hpf-sandbox-server
```
