### Deploying on Dokku

Note : this is a Dockerfile base dokku deployment

Before installing Dokku, generate new ssh key pair on the server :
```bash
ssh-keygen -t rsa -b 4096
```

## Install Dokku :

```bash
# for debian systems, installs Dokku via apt-get
wget https://raw.githubusercontent.com/dokku/dokku/v0.24.7/bootstrap.sh;
sudo DOKKU_TAG=v0.24.7 bash bootstrap.sh
```

Open the server ip in browser to finish the instalaltion.

Then :

```bash
dokku apps:create appdomain.com
# install the postgres plugin
# plugin installation requires root, hence the user change
sudo dokku plugin:install https://github.com/dokku/dokku-postgres.git
dokku postgres:create exampledb
dokku postgres:link exampledb appdomain.com
dokku config:set appdomain.com LUCKY_ENV=production
dokku config:set appdomain.com APP_DOMAIN=appdomain.com
dokku config:set appdomain.com PORT=5000
dokku config:set appdomain.com STRIPE_SECRET_KEY=**********
dokku config:set appdomain.com MIX_STRIPE_PUBLIC_KEY==**********
dokku config:set appdomain.com STRIPE_WEBHOOK_SECRET==**********
dokku config:set appdomain.com GOOGLE_CLIENT_ID===**********
dokku config:set appdomain.com MIX_GOOGLE_CLIENT_ID==**********
dokku config:set appdomain.com GOOGLE_SECRET_KEY==**********
dokku config:set --no-restart appdomain.com DOKKU_LETSENCRYPT_EMAIL=youremail@provider.com
```
Run the below command to get the database URL.

```bash
dokku postgres:info exampledb
```
Then use the info to set the db url :
```bash
dokku config:set appdomain.com DATABASE_URL=postgres://...
```

Then, back on your remote Dokku server add it to the SECRET_KEY_BASE environment variable.
```bash
dokku config:set appdomain.com SECRET_KEY_BASE=...
```

Make a new commit. Finally you’re ready to deploy. Run the following commands locally. The first will add your server as a remote origin for your git repo. The second will push the code to the server.
```bash
git remote add dokku dokku@ip:appdomain.com
git push dokku master
```

## auto SSL certif
```bash
sudo dokku plugin:install https://github.com/dokku/dokku-letsencrypt.git
dokku config:set --no-restart appdomain.com DOKKU_LETSENCRYPT_EMAIL=your.email@example.com
sudo dokku letsencrypt:enable appdomain.com
```
