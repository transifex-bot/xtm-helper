## xtm-helper

`xtm-helper` is a set of shell scripts that you can use to interact with [XTM](https://xtm.cloud) from the command line.

Each shell script uses the [curl](https://curl.haxx.se/) command to call a method in XTM's REST API.

### List of Scripts

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

#### Download Project File

```
xtm-download-proj-file.bash <project-id> <file-id>
```
