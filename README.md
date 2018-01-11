# pgconn

> A little helper to connect to psql using a connection URI.

## Install

```bash
wget https://raw.githubusercontent.com/miguelmota/pgconn/master/pgconn.sh
chmod +x pgconn.sh
mv pgconn.sh /usr/local/bin/pgconn
```

## Usage

```bash
$ pgconn postgres://awsuser:MySeCrEt@fake-db.bmauoc9z0fpi.us-east-1.rds.amazonaws.com:5432/ebdb

psql (9.6.4, server 9.6.3)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

ebdb=>
```


## License

MIT
