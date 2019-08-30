# ncWMS on Docker

A feature full Tomcat (SSL over APR, etc.) running [ncWMS](http://www.resc.rdg.ac.uk/trac/ncWMS/)

# Why?

The default ncWMS docker image runs in the `ncWMS` context, and we needed an easy way to configure this, mostly for running in the ROOT context.

# Change Web Context

`docker build -t my-cool-custom-web-root --build-arg WEB_CONTEXT=WHATEVER_YOU_WANT .`
