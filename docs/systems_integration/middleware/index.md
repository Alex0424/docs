# Middleware

Middleware acts as a bridge between different applications, systems, or services

Pros:

- Keep track of microservices interactions
- Simplifies communication between different applications

## Diagram

````mermaid
graph TD
    App1["Application 1"]
    App2["Application 2"]
    App3["Application 3"]
    Middleware["Middleware"]
    Service1["Service 1"]
    Service2["Service 2"]

    App1 <--> Middleware
    App2 <--> Middleware
    App3 <--> Middleware
    Middleware <--> Service1
    Middleware <--> Service2
    Middleware <--> Cloud["Cloud Service"]
    Middleware <--> DB["Database"]
````

[Middleware - IBM Video](https://youtu.be/1oWPUpMheGk)