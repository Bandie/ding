# ding
## What is ding?
ding is a client-server thing written in python. Its aim is to execute a set of commands remotely which can be set in the server's config file.

## How does it work?
The server awaits commands sent by the client. A command must be defined in the server's config file, else the server won't do anything.

## What about ding's security?
The authentication is done by an SSL Client Certificate signed by an (own generated) Certificate Authority. The scripts for generating a CA and signing a Server/Client Certificate are also in here to make it (relatively) easy. [ You need only to press enter in the most cases, type in some certificate information and entering a previously defined CA password. ]

## Pic or didn't happen
![Screenshot of ding](/img/dingScreenshot.png)
[Can't read a thing?](https://raw.githubusercontent.com/Bandie/ding/master/img/dingScreenshot.png)

## Installation
In all steps please read carefully what the certification generate scripts want from you. The certificate information needn't to be true at all and can be random. They only need to be different from each other.

1. Run `./1_generateCA.sh` to generate a CA.
2. Run `./2_generateServCert.sh` to generate a signed Server Certificate.
3. Run `./3_generateClientCert.sh` to generate a signed Client Certificate.
4. Move `ding_client`, `ding_client.cfg`, `ding_client.crt`, `ding_client.key` and `CA.crt` to the computer which should be able to send commands to the server.
5. Do some configuration on the server and client (ding\_server.cfg, ding\_client.cfg).
6. Start the server using `./ding_server`. You may want to put this in a tmux session ([Ctrl+B, D] ;) ).
7. Try out the client using `./ding_client <command>`.

## Optional: Cleartext password with timeout
If you want to be sure that the ability of the remote connection won't be abused by bad people using your computer, you may want to add a password. 

To do so:

1. Open your `ding_server.cfg`.
2. Set `pw_on=true`.
3. Set a password, like `password=abc def`.
4. Set a password timeout: `pwtimeout=10` for 10 seconds.

If you have a password with special characters like spaces or something else, you might want to embrace the password in quotation marks, like `./ding_client "abc def"`.
