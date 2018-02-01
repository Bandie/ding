# ding
## What is ding?
ding is a client-server thing written in python. Its aim is to execute a set of commands remotely, which commands can be set in the server's config file.

## How does it work?
The server will wait for a command to be sent by a client. If the command is present within the servers config file it will then execute the command, else nothing will happen.

## What about ding's security?
The authentication is done via a SSL Client Certificate signed by an (self generated) Certificate Authority. The scripts for generating a CA and signing the Server/Client Certificates are also included to make it (relatively) easy. [ This involves typing in a few certificate details and entering a previously defined CA password. ]

## Pic or didn't happen
![Screenshot of ding](/img/dingScreenshot.png)
[Can't read a thing?](https://raw.githubusercontent.com/Bandie/ding/master/img/dingScreenshot.png)

## Installation
At every step please read carefully what the generate certificates scripts want from you. The information on the certificates doesn't need to be true and can be totally random. They only need to be different from one another.

1. Run `./1_generateCA.sh` to generate a CA.
2. Run `./2_generateServCert.sh` to generate a signed Server Certificate.
3. Run `./3_generateClientCert.sh` to generate a signed Client Certificate.
4. Move `ding_client`, `ding_client.cfg`, `ding_client.crt`, `ding_client.key` and `CA.crt` to the computer which should be able to send commands to the server.
5. Do some configuration on the server and client (ding\_server.cfg, ding\_client.cfg).
6. Start the server using `./ding_server`. You may want to put this in a tmux session ([Ctrl+B, D] ;) ).
7. Try out the client using `./ding_client <command>`.

## Optional: Cleartext password with timeout
If you want to be sure that this power won't be abused by bad people using your computer, you may want to add a password (saved in cleartext).
The password will be sent inside the TLS connection.

To do so:

1. Open your `ding_server.cfg`.
2. Set `pw_on=true`.
3. Set a password, like `password=abc def`.
4. Set a password timeout: `pwtimeout=10` for 10 seconds.

If you have a password with special characters as in spaces and the like, you may want to use quotation marks around your password. `./ding_client "abc def"`.
