# Rabbit MQ

## BEFORE: Monolithic Architecture

````mermaid
graph TD
    Producer["Checkout Service (Producer)"]
    Inventory["Inventory Service (Consumer)"]

    Producer --> Inventory
````

Cons of Monolithic Architecture:

- When Checkout Service needs to update Inventory Service, it makes a direct call.
- This creates tight coupling between services, making it hard to scale and maintain.
- Inventory Service neads to hear and reply to every request from Checkout Service, leading to potential bottlenecks.
- If inventory service is down, Checkout Service will try over and over again to reach it, leading to failures.
- If alot of requests come in, Inventory Service can get overwhelmed and crash.

## AFTER: Using Rabbit MQ as Message Broker

````mermaid
graph TD
    Producer["Checkout Service (Producer)"]
    RabbitMQ["Rabbit MQ (Message Broker)"]
    Consumer["Inventory Service (Consumer)"]

    Producer --> RabbitMQ
    RabbitMQ --> Consumer
````

Pros of using Rabbit MQ:

- Checkout Service sends messages to Rabbit MQ instead of directly calling Inventory Service.
- Rabbit MQ acts as an intermediary, decoupling the services.
- If Inventory Service is down, messages are queued in Rabbit MQ and processed once it's back up.
- If many requests come in, they are queued in Rabbit MQ, preventing overload on Inventory Service.
- Inventory Service processes messages from Rabbit MQ at its own pace, improving reliability and scalability.
- Rabbit MQ can handle high volumes of messages, preventing overload on Inventory Service.

Cloud friendly

- Rabbit MQ can be deployed in cloud environments & containerization, making it easier to scale and manage.

Can be run in a cluster that provides:

- Fault Tolerance
- High Availability
- High Throughput

Cross Language Communication

- Rabbit MQ supports multiple programming languages, allowing services written in different languages to communicate seamlessly.
    - Python, Java, C#, JavaScript, Ruby, Go, etc.

Security

- FASL, LDAP, TLS/SSL for authentication & encryption.

Acks

- Ensures messages are delivered reliably.
- Message stays in the queue until the consumer acknowledges successful processing.

Management UI

- Web-based UI for monitoring and managing Rabbit MQ server, queues, exchanges, and connections.

Open Source

- Rabbit MQ is open-source, with a large community and extensive documentation.

- Wide range of plugins and extensions available.

Message Models

- AMQP 0-9-1 (Advanced Message Queuing Protocol) - primary protocol used by Rabbit MQ
- MQTT (Message Queuing Telemetry Transport)
- AMQP 1.0

## Exchages in Rabbit MQ (Message Model: AMQP 0-9-1)

- Exchanges are responsible for routing messages to queues based on predefined rules.

### Fanout Exchange

````mermaid
graph TD
    Producer["Producer"]
    Exchange["Fanout Exchange"]
    Queue1["Queue 1"]
    Queue2["Queue 2"]
    Queue3["Queue 3"]
    Consumer1["Consumer 1"]
    Consumer2["Consumer 2"]
    Consumer3["Consumer 3"]

    Producer -- "<span style='color:#43a047'> Message</span>" --> Exchange
    Exchange --> Queue1
    Exchange --> Queue2
    Exchange --> Queue3
    Queue1 --> Consumer1
    Queue2 --> Consumer2
    Queue3 --> Consumer3

    %% Styling for border colors only
    classDef green stroke:#43a047,stroke-width:2px;
    class Queue1 green;
    class Queue2 green;
    class Queue3 green;
````

### Direct Exchange

````mermaid
graph TD
    Producer["Producer"]
    DirectExchange["Direct Exchange"]
    QueueA["Queue A"]
    QueueB["Queue B"]
    QueueC["Queue C"]
    ConsumerA["Consumer A"]
    ConsumerB["Consumer B"]
    ConsumerC["Consumer C"]

    Producer -- "<span style='color:#e53935'>Message 1 <br> RoutingKeyRed</span>" --> DirectExchange
    Producer -- "<span style='color:#1e88e5'>Message 2 <br> RoutingKeyBlue</span>" --> DirectExchange
    Producer -- "<span style='color:#43a047'>Message 3 <br> RoutingKeyGreen</span>" --> DirectExchange
    DirectExchange -- "<span style='color:#e53935'>red (binding key: red)</span>" --> QueueA
    DirectExchange -- "<span style='color:#1e88e5'>blue (binding key: blue)</span>" --> QueueB
    DirectExchange -- "<span style='color:#43a047'>green (binding key: green)</span>" --> QueueC
    QueueA --> ConsumerA
    QueueB --> ConsumerB
    QueueC --> ConsumerC

    %% Styling for background colors
    classDef red color:#b71c1c,stroke:#e53935,stroke-width:2px;
    classDef blue color:#0d47a1,stroke:#1e88e5,stroke-width:2px;
    classDef green color:#1b5e20,stroke:#43a047,stroke-width:2px;
    class QueueA red;
    class QueueB blue;
    class QueueC green;
````

### Topic Exchange

````mermaid
graph TD
    Producer["Producer"]
    TopicExchange["Topic Exchange"]
    QueueA["Queue A (topic: red.*)"]
    QueueB["Queue B (topic: blue.*)"]
    QueueC["Queue C (topic: green.*)"]
    ConsumerA["Consumer A"]
    ConsumerB["Consumer B"]
    ConsumerC["Consumer C"]

    Producer -- "<span style='color:#e53935'>Message 1 <br> red.info</span>" --> TopicExchange
    Producer -- "<span style='color:#1e88e5'>Message 2 <br> blue.error</span>" --> TopicExchange
    Producer -- "<span style='color:#43a047'>Message 3 <br> green.status</span>" --> TopicExchange
    TopicExchange -- "<span style='color:#e53935'>red.* <br> binding</span>" --> QueueA
    TopicExchange -- "<span style='color:#1e88e5'>blue.* <br> binding</span>" --> QueueB
    TopicExchange -- "<span style='color:#43a047'>green.* <br> binding</span>" --> QueueC
    QueueA --> ConsumerA
    QueueB --> ConsumerB
    QueueC --> ConsumerC

    %% Styling for background colors
    classDef red color:#b71c1c,stroke:#e53935,stroke-width:2px;
    classDef blue color:#0d47a1,stroke:#1e88e5,stroke-width:2px;
    classDef green color:#1b5e20,stroke:#43a047,stroke-width:2px;
    class QueueA red;
    class QueueB blue;
    class QueueC green;
````

### Header Exchange

x-match: all

- matches all headers (all must be present)

x-match: any

- matches any header (one or more)

````mermaid
graph TD
    Producer["Producer"]
    HeaderExchange["Header Exchange"]
    QueueA["Queue A"]
    QueueB["Queue B"]
    QueueC["Queue C"]
    ConsumerA["Consumer A"]
    ConsumerB["Consumer B"]
    ConsumerC["Consumer C"]

    Producer -- "<span style='color:#e53935'>Message 1 <br> Headers: <br> type=pdf, format=A4</span>" --> HeaderExchange
    Producer -- "<span style='color:#1e88e5'>Message 2 <br> Headers: <br> type=doc, format=Letter</span>" --> HeaderExchange
    Producer -- "<span style='color:#43a047'>Message 3 <br> Headers: <br> type=img, format=PNG</span>" --> HeaderExchange
    HeaderExchange -- "<span style='color:#43a047'>x-match: all, headers: type=img, format=PNG <br> binding</span>" --> QueueA
    HeaderExchange -- "<span style='color:#1e88e5'>x-match: any, headers: type=doc, format=Letter <br> binding</span>" --> QueueB
    HeaderExchange -- "<span style='color:#e53935'>x-match: all, headers: type=pdf, format=A4 <br> binding</span>" --> QueueC
    QueueA --> ConsumerA
    QueueB --> ConsumerB
    QueueC --> ConsumerC
````

### Default Exchange

- routing key is tied to the queue name

````mermaid
graph TD
    Producer["Producer"]
    DefaultExchange["Default Exchange"]
    QueueA["Queue A"]
    QueueB["Queue B"]
    QueueC["Queue C"]
    ConsumerA["Consumer A"]
    ConsumerB["Consumer B"]
    ConsumerC["Consumer C"]

    Producer -- "<span style='color:#e53935'>Message 1 <br>Queue A</span>" --> DefaultExchange
    Producer -- "<span style='color:#1e88e5'>Message 2 <br>Queue B</span>" --> DefaultExchange
    Producer -- "<span style='color:#43a047'>Message 3 <br>Queue C</span>" --> DefaultExchange
    DefaultExchange --> QueueA
    DefaultExchange --> QueueB
    DefaultExchange --> QueueC
    QueueA --> ConsumerA
    QueueB --> ConsumerB
    QueueC --> ConsumerC

    %% Styling for background colors
    classDef red color:#b71c1c,stroke:#e53935,stroke-width:2px;
    classDef blue color:#0d47a1,stroke:#1e88e5,stroke-width:2px;
    classDef green color:#1b5e20,stroke:#43a047,stroke-width:2px;
    class QueueA red;
    class QueueB blue;
    class QueueC green;
````

Sources:

- [Video - What is RabbitMQ - IBM](https://youtu.be/7rkeORD4jSw)
- [RabbitMQ official website - RabbitMQ](https://www.rabbitmq.com/)