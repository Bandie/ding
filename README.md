# ding
## What is ding?
ding is a client-server thing written in python. Its aim is to execute a set of commands remotely which can be set in the server's config file.

## How does it work?
The server awaits the client's commands. A command sent by the client must be defined in the server's config file, else the server won't do anything.

## What about ding's security?
The authentication is done by an SSL Client Certificate signed by an (own generated) Certificate Authority. The scripts for generating a CA and signing a Server/Client Certificate are also in here to make it (relatively) easy. [ You need only to press enter in the most cases, type in some certificate information and entering a previously defined CA password. ]


## Installation
In all steps please read carefully, what the generating script want from you.

1. Run `./1_generateCA.sh` to generate a CA.
2. Run `./2_generateServCert.sh` to generate a signed Server Certificate.
3. Run `./3_generateClientCert.sh` to generate a signed Client Certificate.
4. Move ding\_client, ding\_client.cfg, ding\_client.crt, ding\_client.key to the computer which should be able to send commands to the server.
5. Do some configuration on the server and client (ding\_server.cfg, ding\_client.cfg).
6. Start the server using `./ding_server`. You may want to put this in a tmux session ([Ctrl+B, D] ;) ).
7. Try out the client using `./ding_client <command>`.


