# docker-node-quic
Docker image for [Node.js with QUIC](https://github.com/nodejs/quic)

## Usage

You can docker-run with `docker run -it nwtgck/node-quic` as follows.

```console
$ docker run -it nwtgck/node-quic
Welcome to Node.js v14.0.0-pre.
Type ".help" for more information.
> const { createQuicSocket } = require('net');
undefined
```

You can get more detail examples and descriptions about the usage of QUIC in Node.js in the following.  
[quic/quic.md at cee2e5d079ca2b55e421d81df1ad131c1bfeecc6 · nodejs/quic](https://github.com/nodejs/quic/blob/cee2e5d079ca2b55e421d81df1ad131c1bfeecc6/doc/api/quic.md)

## Article
Here is an article to get example.

[Try QUIC in Node.js on Docker - DEV Community 👩‍💻👨‍💻](https://dev.to/nwtgck/try-quic-in-node-js-on-docker-l8c)

