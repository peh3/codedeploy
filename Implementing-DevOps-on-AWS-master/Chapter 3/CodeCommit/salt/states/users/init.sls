tk:
  user.present:
    - fullname: TK
    - uid: {{ salt['pillar.get']('users:tk:uid') }}
    - password: {{ salt['pillar.get']('users:tk:password') }}
    - groups:
      - wheel

  ssh_auth.present:
    - user: tk
    - source: salt://users/files/tk.pub
    - require:
      - user: tk

sudoers:
  file.managed:
   - name: /etc/sudoers.d/wheel
   - contents: '%wheel  ALL=(ALL)  ALL'
