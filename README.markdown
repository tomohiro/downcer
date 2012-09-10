Downcer
================================================================================

Command line download tools helper

Installation
-------------------------------------------------------------------------------

TODO


Usage
-------------------------------------------------------------------------------

1. Configuretion

        $ vi ~/downcerrc
        youtube.com:
          command: 'youtube-dl'
          option:  '-t'
        github.com:
          command: 'hub'
          option:  'clone'

2. Run `downcer`

        $ downcer https://github.com/sinatra/sinatra
        Cloning into 'sinatra'...
        remote: Counting objects: 11686, done.
        remote: Compressing objects: 100% (4890/4890), done.
        remote: Total 11686 (delta 7202), reused 11030 (delta 6617)
        Receiving objects: 100% (11686/11686), 2.07 MiB | 348 KiB/s, done.
        Resolving deltas: 100% (7202/7202), done.


LICENSE
--------------------------------------------------------------------------------

&copy; 2012 Tomohiro, TAIRA.
This project is licensed under the MIT license.
See LICENSE for details.
