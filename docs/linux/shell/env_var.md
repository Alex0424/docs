# Environment Variables

## Option 1: Activate from CLI (Command Line Interface) 

```shell
export team=ops
```
> The `export` keyword is required so that the variable is available to child processes, such as scripts or applications launched from your shell.

Validate
```shell
echo $team
```

## Option 2: Activate Variables While Starting a Script

You can set a temporary environment variable just for the duration of a command

```
team=ops python3 main.py
```

Sets team=ops only for the main.py process and any child processes that main.py spawns.

## Option 3: Activate from `.env` file

1. Create the `.env` file:

```shell
echo "export team=ops" >> .env
```

2. Load the environment variables:

```shell
source .env
```

> Using `export` in the `.env` file ensures the variable is available to child processes.


## Repository Security

To keep environment variables secure, ensure `.env` is ignored by version control:

```
echo ".env" >> .gitignore
```

This prevents accidentally committing sensitive information to your repository.

## Print environments activated for a specific PID

```
MY_PID=$$ \
&& cat /proc/$MY_PID/environ
```
