# HTTPS

## What is TLS

- Transport Layer Security is how the signal travel over the internet via traffic while being secure.

Header Diagram of how internet works without encryption:

```
HTTP <- TCP <- IP <- ETH
```

- IPsec is an encrypted but might not be supported by all routers.
- To be sure the signal is Encrypted we will need to encrypt the HTTP.

## History of SSL -> TLS

### SSL V1

SSL is put in between HTTP and TCP which makes the HTTP information part will be "encrypted".

Researchers in netscape developed SSL version 1 in 1994

Replay attacks

- Simple checksum
- No sequence numbers
- Only for internal

### SSL V2

- Better md5 constructor
- Netscape petended this in 1995

- In 1995 Microsoft release tech very similar to SSL called PCT (Private Communication Technology)

- It wat iteroperable which did make web browsers and web servers support this

## SSL V3

1996 Netscape release SSL 3 (much better than SSL V2) was released

- Incorporated technology from PCT
- 2 different HTTPS Encryption Methods is not good so "Internet Engineering Task Force" suggested to create a working group for this:
    - "Transport layer security working group" (TLS working group).

- The point is to have a standard use the same one
- Renamed from SSL to TLS (because microsoft do not want Netscape on their name)
- Working group formed in 1966 byt tooj them untill 1999 to get a proper release out (TLS V1).

## Technical Part of TLS

- Cryptographic protocol between two parties, they have to agree, follow rules based on message structure etc...
- What ciphers (algorithm type for data encryption and decryption) to use.
    - Ciphers have changed over the years because older ones are no longer seen as secure.
    - Now we use modern AAD (Additional Authentication Data) encryption.
- Message structure is fixed
    - It does not mater if the webserver is programmed in another language

## Security

- SSL is now deprecated (SSL 2.0 and 3.0)
    - Severe security vulnerabilities

- TLS is the daily standard for HTTPS Encryption Today

- Secret key
    - Message authentication
        - Public key
- Robust to "man in the middle attacks", "replay attacks", "downgrade attacks".
- The message needs to be quick
    - Example TLS 1.2 does this with two round trips client to server and back and repeated again.

## SSL Certificate

Coming soon

## TLS Certificate

Coming soon

## Handshake TLS 1.2 VS 1.3

Coming soon

Sources:

- [TLS - Text - CloudFlare](https://www.cloudflare.com/en-gb/learning/ssl/transport-layer-security-tls/)
- [TLS - Video](https://www.youtube.com/watch?v=0TLDTodL7Lc)
- [Handshake - Video](https://youtu.be/86cQJ0MMses)
