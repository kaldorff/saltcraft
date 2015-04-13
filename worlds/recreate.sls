{%
  set server  =  salt['pillar.get']('s')
%}
{%
  set port = salt['pillar.get']('p')
%}

delete-server:
  cmd.run:
    - name: yes | sudo msm server delete {{ server }}
    - cwd: /

create-server:
  cmd.run:
    - name: sudo msm server create {{ server }} 

eula:
  file.append:
    - name: /opt/msm/servers/{{ server }}/eula.txt
    - text: "eula=true"

eula-owner:  
  file.managed:
    - name: /opt/msm/servers/{{ server }}/eula.txt
    - user: minecraft
    - group: minecraft

remove-jar:
  file.absent:
    - name: /opt/msm/servers/{{ server }}/server.jar

symlink-jar:
  file.symlink:
    - name: /opt/msm/servers/{{ server }}/server.jar
    - target: /opt/msm/jars/minecraft/minecraft_server.1.8.jar 
    - user: minecraft
    - group: minecraft

copy-properties:
  file.managed:
    - name: /opt/msm/servers/{{ server }}/server.properties
    - source: salt://files/server.properties
    - user: minecraft
    - group: minecraft

change-port:
  file.replace:
    - name: /opt/msm/servers/{{ server }}/server.properties
    - pattern: server-port=DEFAULT
    - repl: server-port={{ port }}

change-motd:
  file.replace:
    - name: /opt/msm/servers/{{ server }}/server.properties
    - pattern: motd=DEFAULT 
    - repl: motd={{ server }} Minecraft Server

copy-logo:
  file.managed:
    - name: /opt/msm/servers/{{ server }}/server-icon.png
    - source: salt://files/blue-green-earth.png
    - user: minecraft
    - group: minecraft

copy-whitelist:
  file.managed:
    - name: /opt/msm/servers/{{ server }}/whitelist.json
    - source: salt://files/whitelist.json
    - user: minecraft
    - group: minecraft

copy-ops:
  file.managed:
    - name: /opt/msm/servers/{{ server }}/ops.json
    - source: salt://files/ops.json
    - user: minecraft
    - group: minecraft

start-server:
  cmd.run:
    - name: sudo msm {{ server }} start
