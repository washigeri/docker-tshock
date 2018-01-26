# tShock Docker App

A docker app to run a tShock server for Terraria based on frolvlad/alpine-mono

Startup script borrowed from silvertoken/tshock-docker

----

**Initial run to generate world**

This will start the server in interactive mode and allow you to create a world.  It mounts all the volumes into directories under the location you specify. As an example you could use like /opt/tshock for your file locations.

`docker run -it -p 7777:7777 -v <path to config>:/config -v <path to logs>:/logs -v <path to world>:/world -v <path to plugins>:/plugins --name="tshock" mark2dot0/tshock`

example usage:

`docker run -it -p 7777:7777 -v /opt/tshock/config:/config -v /opt/tshock/logs:/logs -v /opt/tshock/world:/world -v /opt/tshock/plugins:/plugins --name="tshock" mark2dot0/tshock`

**Autoload world and detach**

This command will autoload the world you made above and detach from the process so that it runs in the background.

`docker run -dit -p 7777:7777 -v /opt/data/tshock/config:/config -v /opt/data/tshock/logs:/logs -v /opt/data/tshock/world:/world -v /opt/data/tshock/plugins:/plugins mark2dot0/tshock-docker -world /world/<name of world you made>.wld`
