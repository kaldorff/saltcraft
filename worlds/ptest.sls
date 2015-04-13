{% 
  set server  =  salt['pillar.get']('s') 
%}
{%
  set port = salt['pillar.get']('p')
%}



test-print:
  cmd.run:
    - name: echo {{ server  }} {{port}} 
