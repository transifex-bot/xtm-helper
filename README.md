## xtm-helper

`xtm-helper` is a set of shell scripts that you can use to interact with [XTM](https://xtm.cloud) from the command line.

Each shell script uses the [curl](https://curl.haxx.se/) command to call a method in XTM's REST API.

### List of Scripts

#### List Projects

```
xtm-list-projects.bash
```

#### Upload Project Files

```
xtm-upload-proj-files.bash `<project-id>`.
```

Run `xtm-list-projects.bash` to get the <project-id> needed here.

#### Download Project Files

```
xtm-download-proj-files.bash <project-id>
```

Run `xtm-list-projects.bash` to get the <project-id> needed here.

### Before using the xtm-helper

You will need to run `xtm-get-token`.

Take the output token and create a file named "xtm-basic-token.txt". This file is referred to as our "curl config file".

Copy the following and paste it in the curl config file.

```
header: "Authorization: XTM-Basic <replace this with the token info>"
```

All of the xtm-helper scripts refer to this curl config file.
