/etc/apt/sources.list:
  file.append:
    - text: deb http://overviewer.org/debian ./

accept-key:
  cmd.run:
    - name: wget -O - http://overviewer.org/debian/overviewer.gpg.asc | sudo apt-key add -

minecraft-overviewer:
  pkg.installed:
    - refresh: True
