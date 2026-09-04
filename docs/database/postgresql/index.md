# PostgreSQL

## `psql` commands

### Login

```sh
PGPASSWORD="$PASSWORD" psql -h "$HOST" -p "$PORT" -U "$USERNAME" -d "$DATABASE"
```

### Display Tables

```sql
\dt
```

### Describe a Table

```sql
\d table_name
```

### SELECT

```sql
SELECT column_1, column_2
FROM "Table"
WHERE column_1 = 'mega_iphone_release_1';
```