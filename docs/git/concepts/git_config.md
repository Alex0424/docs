# Git Config

3 levels of git config hierarchy

```mermaid
flowchart TD
    subgraph System["System Level - Operating System"]
        direction TB
        S1["Base: git config --system"]
        S2["View: git config --system --list"]
        S3["Stored: /etc/gitconfig (UNIX)<br/>C:\Documents and Settings\All Users\Application Data\Gitconfig (WINDOWS)"]
        S1 --- S2 --- S3
    end
    
    subgraph Global["Global Level - User Specific"]
        direction TB
        G1["Base: git config --global"]
        G2["View: git config --global --list"]
        G3["Stored: ~/.gitconfig (UNIX)<br/>C:\Users\.gitconfig (WINDOWS)"]
        G1 --- G2 --- G3
    end
    
    subgraph Local["Local Level - Repository Specific"]
        direction TB
        L1["Base: git config --local"]
        L2["View: git config --local --list"]
        L3["Stored: .git/config"]
        L1 --- L2 --- L3
    end
    
    System -->|Override| Global
    Global -->|Override| Local
    
    style System fill:#2d8a8a,stroke:#333,stroke-width:2px,color:#fff
    style Global fill:#b8860b,stroke:#333,stroke-width:2px,color:#fff
    style Local fill:#d96e4f,stroke:#333,stroke-width:2px,color:#fff
```

## Level 1: System - Operating System

- **BASE:** `git config --system`
- **VIEW:** `git config --system --list`
- **Stored:** `/etc/gitconfig`

## Level 2: Global - User Specific

- **BASE:** `git config --global`
- **VIEW:** `git config --global --list`
- **Stored:** `~/.gitconfig`

## Level 3: Local - Repository Specific

- **BASE:** `git config --local`
- **VIEW:** `git config --local --list`
- **Stored:** `.git/config`
