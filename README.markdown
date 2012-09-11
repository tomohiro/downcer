Downcer
================================================================================

[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/Tomohiro/downcer)

Command line download tool helper


---


Requirements
-------------------------------------------------------------------------------

- Ruby 1.9.X
- curl / wget


Installation
-------------------------------------------------------------------------------

[RubyGems](http://rubygems.org)

    gem install downcer


[Bundlizer](http://tomohiro.github.com/bundlizer)

    $ bundlizer install Tomohiro/downcer


Usage
-------------------------------------------------------------------------------

1. Configuretion (Format is YAML)

    Edit `.downcerrc`, and put your home direcotry.

        $ vi ~/.downcerrc
        ---
        youtube.com:
          command: youtube-dl
          option:  -t
        raw.github.com
          command wget
        github.com:
          command: hub
          option:  clone
        my.private.server.local:
          command: wget
          option:  --http-user=username --http-password=password
        default:
          command: curl
          option: -LO

2. Run `downcer`

    YouTube ([youtube-dl](http://rg3.github.com/youtube-dl))

    ```sh
    $ downcer 'http://www.youtube.com/watch?v=QH2-TGUlwu4'
    Use `youtube-dl`
    --
    [youtube] Setting language
    [youtube] QH2-TGUlwu4: Downloading video webpage
    [youtube] QH2-TGUlwu4: Downloading video info webpage
    [youtube] QH2-TGUlwu4: Extracting video information
    [download] Destination: Nyan_Cat_original-QH2-TGUlwu4.flv
    [download] 100.0% of 13.93M at    1.90M/s ETA 00:00
    ```

    GitHub Repository

    ```sh
    $ downcer https://github.com/holman/spark
    Use `hub`
    --
    Cloning into 'spark'...
    remote: Counting objects: 193, done.
    remote: Compressing objects: 100% (105/105), done.
    remote: Total 193 (delta 99), reused 174 (delta 85)
    Receiving objects: 100% (193/193), 31.69 KiB, done.
    Resolving deltas: 100% (99/99), done.
    ```

    Private basic authentication file server

    ```sh
    $ downcer http://my.private.server.local/movies/sample.mp4
    Use `wget`
    --
    --2012-09-11 21:19:11--  http://my.private.server.local/movies/sample.mp4
    Resolving my.private.server.local... 10.0.1.2
    Connecting to my.private.server.local|10.0.1.2|:80... connected.
    HTTP request sent, awaiting response... 401 Unauthorized
    Reusing existing connection to my.private.server.local:80.
    HTTP request sent, awaiting response... 200 OK
    Length: 208737764 (199M) [text/plain]
    Saving to: ‘sample.m4v’
    100%[=================================================================>] 208,737,764 2.49MB/s   in 98s

    2012-09-11 21:20:49 (2.04 MB/s) - ‘sample.m4v’ saved [208737764/208737764]
    ```


LICENSE
--------------------------------------------------------------------------------

&copy; 2012 Tomohiro, TAIRA.
This project is licensed under the MIT license.
See LICENSE for details.
