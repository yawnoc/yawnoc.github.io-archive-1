**This is archive-1. For the current version,
see <https://github.com/yawnoc/yawnoc.github.io>.**

# yawnoc.github.io-archive-1

Conway's site: https://yawnoc.github.io

Built using [Conway's markdown (CMD)][cmd].

## Building

````bash
$ cmd
$ ./minify-resources
$ ./generate-sitemap.py
````

## Testing

I recommend [http-server (npm)][http-server],
since it supports clean URLs (default extension `.html`)
and serves `404.html` if a file is not found.

[cmd]: https://github.com/conway-markdown/conway-markdown
[http-server]: https://github.com/http-party/http-server
