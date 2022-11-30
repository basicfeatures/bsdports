# bsdports.net

    bundle install
    yarn install

    export BSDPORTS_DATABASE_PASSWORD="<your password>"

    rm config/credentials.yml.enc
    EDITOR=mate bin/rails credentials:edit

### Database

    export RAILS_ENV=production

    rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
    rails db:create
    rails db:migrate
    rails db:seed

    rails import:openbsd
    rails import:freebsd
    rails import:netbsd

### JS, CSS and images

    rm -rf public/assets/* app/assets/builds/*

    rails javascript:clobber javascript:build
    rails css:clobber css:build
    rails assets:clean assets:clobber assets:precompile

### Development

    bin/dev

### Test

    rspec

### Cleanup

    rails tmp:clear log:clear

    git reflog expire --expire=now --all
    git fsck --full
    git gc --prune=now

