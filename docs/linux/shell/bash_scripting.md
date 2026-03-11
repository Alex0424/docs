# [Bash Scripting](https://www.gnu.org/software/bash/manual/bash.html)

## Shebang

```bash
#!/bin/bash   # bash shell binary execution location
```

## Variables

```bash
public_var="value" 
local local_var="local_value"  # local variable inside function
echo $public_var        # access variable value
echo $0               # access script name
echo $1               # access first script argument
echo $@               # access all script arguments
echo $#               # access number of script arguments
echo $$               # access current script PID
echo $?               # access last command exit code
```

## Arrays

### Indexed

```bash
array=("value1" "value2" "value3")
echo ${array[0]}        # access first element
echo ${array[@]}        # access all elements
```

### Associative

```bash
declare -A assoc_array=(
    ["key1"]="value1"
    ["key2"]="value2"
)
echo ${assoc_array["key1"]}         # access value by key
echo ${!assoc_array[@]}             # access all keys
echo ${assoc_array[@]}              # access all values
```

## Loops

### Numeric (c-style) - fastest loop

```bash
for ((i=1; i<=10; i++)); do
    echo "$i"
done
```

### Array

```bash
item_list=("item1" "item2" "item3")

for items in "${item_list[@]}"
do
    echo $items
done
```

### Infinite

```bash
while :; do # same as while true but faster
    echo "Looping..."
    sleep 1
done
```

## Exit Codes

0 = Match Found / Success

```bash
exit 0
```

`echo $?`: `0`

1 = No Match Found

```bash
exit 1
```

`echo $?`: `1`

2 = Syntax or File Error

```bash
echo "Something went wrong" >&2
exit 2
```

`echo $?`: `2`

## Avoid Error Stopping Script Execution

option 1 (fastest):

```bash
git clone hello.git || :
```

option 2:

```bash
set +e
git clone hello.git
set -e
```

option 3:

```bash
if ! git clone hello.git; then
    echo "Clone failed, continuing anyway..."
fi
```

option 4:

```bash
git clone hello.git || /bin/true
```

## Debug Mode

```bash
set -x  # enable debug mode
set +x  # disable debug mode
```