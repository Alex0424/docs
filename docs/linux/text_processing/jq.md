# [JQ](https://jqlang.org/)

`input.json`

```json
{
    "key_1": "value_1",
    "key_2": "value_2",
    "list_1": [
        {
            "key_1": "value_1a",
            "key_2": "value_2a",
            "key_3": {"key_1": "value_x"},
            "key_4": ["item_1a", "item_2a", "item_3a"],
            "list_2": [
                {
                    "key_1": "value_1aa",
                    "key_2": "value_2aa"
                },
                {
                    "key_1": "value_1ba",
                    "key_2": "value_2ba"
                }
            ]
        },
        {
            "key_1": "value_1b",
            "key_2": "value_2b",
            "key_3": {"key_1": "value_y"},
            "key_4": ["item_1b", "item_2b", "item_3b"],
            "list_2": [
                {
                    "key_1": "value_1ab",
                    "key_2": "value_2ab"
                },
                {
                    "key_1": "value_1bb",
                    "key_2": "value_2bb"
                }
            ]
        }
    ]
}
```

Get all `key_2` values from `list_2` inside `list_1`:

```shell
jq -rc .list_1[].list_2[].key_2 input.json
```

Get specific items:

```shell
jq -rc .list_1[0].list_2[1].key_2 input.json
```

Get last item in `key_4` array inside `list_1`:

```shell
jq -rc '.list_1[].key_4[-1]' input.json
```