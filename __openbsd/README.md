# bsdports.net OpenBSD

    pkg_add ruby git zsh

Create unprivileged user and group `bsdports`:

    adduser

Copy over config files:

    cp -R etc/ /
    cp -R var/ /

### Firewall

Install [pf-badhost](https://www.geoghegan.ca/pub/pf-badhost/latest/install/openbsd.txt).

IPv4 addresses in table: 614714443

### PostgreSQL

    pkg_add postgresql-server

    cd /home/bsdports/

    rcctl enable postgresql
    doas -u _postgresql initdb -D /var/postgresql/data/ -U postgres
    rcctl start postgresql

    doas -u _postgresql psql -U postgres

    CREATE ROLE <shell username> LOGIN SUPERUSER PASSWORD '<password>';

### Redis

    pkg_add redis

Ensure `port 6379` is set in `/etc/redis/redis.conf`.

    rcctl enable redis
    rcctl start redis

## Ruby

    bundle config set path $HOME/.bundle/
    echo "path+=($HOME/.gem/ruby/3.1/bin)" >> ~/.zprofile
    source ~/.zprofile

### Rails

    cd ~/
    gem install --user-install nokogiri -- --use-system-libraries
    gem install --user-install rails

    echo "alias rails='rails31'" >> ~/.zshrc
    source ~/.zshrc

    cd ~/bsdports/
    bundle

### JavaScript

    pkg_add node libiconv libxml libxslt
    bundle config build.nokogiri --use-system-libraries
    echo "path+=($HOME/.local/share/gem/ruby/3.1/bin)" >> ~/.zprofile
    source ~/.zprofile

Install Yarn package manager for Node:

    npm install --global yarn
    yarn

Prevent Node error `/tmp/yarn--XXX/node[X]: /tmp/yarn--XXX/../node: not found`:

    ln -s /usr/local/bin/node /tmp/node

### CSS

    pkg_add sass

## TLS

Generate certificates and crontabs:

    bin/mkcerts

    rcctl enable relayd
    rcctl start relayd

## Startup

    chmod +x /etc/rc.d/bsdports

    rcctl enable bsdports
    rcctl start bsdports

Or debug:

    rcctl -d start bsdports

