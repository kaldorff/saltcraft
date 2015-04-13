# saltcraft
salt setup for Overviewer/MSM etc

Prep work

1.  Install a Debian server
2.  Install salt-minion
3.  Install sudo (if not there already)
4.  Install Minecraft MSM
5.  Get this code to your salt-master base
6.  Edit whitelist.json and ops.json for your own users
7.  Change server.properties to the type of server you want (will add more properties later)

Salt fun!  Edit your top.sls for your server if you want to do highstate (recommended)

1. highstate
2. salt SERVER state.sls worlds.recreate pillar='{s: WORLD, p: PORT }'

Repeat #2 until you get the world you want!  Then don't run again or it gets wiped...

You can run with a different world and port # to create/recreate a new server

