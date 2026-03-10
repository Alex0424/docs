# Get Commands

## Get Command

Shows all available commandlets/functions that we can run

### Run

```sh
Get-Command
```

### Rules

Everything has to be in form of `<verb>-<noun>` or `<action>/<object>`

### Get-Command filter

#### Find commands that include a noun that start with `S*` (RegEx)

```sh
Get-Command -noun S*
```

## Get Service

List status / name / DisplayName for all services 

```
Get-Service
```

## Get-Help

### Manual

Syntax:

```sh
Get-Help <get command>
```

Example:

```sh
Get-Help Get-Service
```

### Get Examples

```sh
Get-Help <get command> -Examples
```

### Get Online

```
Get-Help <get command> -Online
```

### Get Alias

```sh
Get-Alias <alias command>
```

### Get Process

```sh
Get-Process -Name <process_name>
```

### Get Member

Get member alias/events/methods/properties 

```sh
<get command> <subcommand> | Get-Member
```

Example:

```sh
Get-Process -Name microsoftEdge | Get-Member
```

### Select Object

Get all properties about an object

```sh
<get command> <subcommand> | Select-Object *
```

Example:

```sh
Get-Process -Name microsoftEdge | select-object *
```

## Sources

(Microsoft - Text)[https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-command?view=powershell-7.5]
(YouTube - Video)[https://youtu.be/IHrGresKu2w]
  - 15:16 minutes
