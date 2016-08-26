# Dockerised simplegit

This implements a minimal git-capable Docker image, based on top of the latest
official [Alpine](https://hub.docker.com/_/alpine/) image and the
[libgit2](https://github.com/libgit2/libgit2)-based client
[simplegit](https://github.com/sba1/simplegit).

The image installs a `sgit` client in `/usr/local/bin`. This client mostly has
the same commane-line interface than the regular `git` command-line client. It
provides a sane subset of the sub-commands needed in most cases.

The [Dockerfile](https://docs.docker.com/engine/reference/builder/) is carefully
crafted to left as little remains as possible, which results in an image which
is only 5MB bigger than the original Alpine image. In comparison, an image that
would add the [git](http://pkgs.alpinelinux.org/package/v3.4/main/x86_64/git)
Alpine package and its dependencies takes 17MB. A Dockerfile for such an image
is provided as an example.

Depending on your workflow, this might not be what you want. Building proper
`libgit2` and `simplegit` packages for Alpine might be a more suitable approach.