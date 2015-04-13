#!/bin/bash
sudo msm server delete epsilon
sleep 3
sudo msm server create epsilon
sleep 3
cp eula.txt /opt/msm/servers/epsilon/eula.txt
cp /opt/msm/servers/server.properties.epsilon /opt/msm/servers/epsilon/server.properties
rm -rf /opt/msm/servers/epsilon/server.jar
ln -s /opt/msm/jars/minecraft/minecraft_server.1.8.jar /opt/msm/servers/epsilon/server.jar

sudo msm epsilon start
