# aulo

A tool for quickly switching between desired directories in the Linux command-line.

Assign a short command to a directory, then simply type `aulo PROMPT` to quickly switch to that directory.

### Operations:
```
-c, --create    create an OPTION (aulo -c COMMAND DIR)
-d, --delete    delete an OPTION (aulo -d COMMAND)
-r, --rename    rename an OPTION'S command (aulo -r OLD_CMD NEW_CMD)
-l, --list      list all currently existing OPTIONS
```

### Setup
Simply clone the repo and run `bash install.sh`.

### Examples:
`aulo -c photo /home/user/Desktop/Photos`

`aulo -r photo old_photos`

`aulo old_photos`

`aulo -d old_photos`
