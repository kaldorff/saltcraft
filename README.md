# saltcraft
salt setup for Overviewer/MSM etc

Prep work
1.  Install a Debian server
2.  Install salt-minion
3.  Install sudo (if not there already)
4.  Install Minecraft MSM

Salt fun!  Edit your top.sls for your server if you want to do highstate (recommended)

1. highstate
2. salt <server> state.sls worlds.recreate pillar='{s: WORLD, p: PORT }'

Repeat #2 until you get the world you want!  Then don't run again or it gets wiped...

You can run with a different world and port # to create/recreate a new server

