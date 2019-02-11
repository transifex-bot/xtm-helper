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

Edit xtm-generate-token.bash setting the following fields:

* userId
* password
* customer name

After you save the changes to the file, run `xtm-generate-token.bash`.

```
$ ./xtm-generate-token.bash
{
   "token" : "vv0h/0J6enimWR5IRXby+Chct4gKvajka2GY9xdhHPhM6TRHwu1uPofr9aGnso6L99CKL9BI/TR4JcxVPr2hWQ=="
}
```

Create a file named "xtm-basic-token.txt". This file is referred to as our "curl config file".

Copy the token and paste it in our curl config file.

Before:

```
header: "Authorization: XTM-Basic <replace this with the token info>"
```

After:
```
header: "Authorization: XTM-Basic vv0h/0J6enimWR5IRXby+Chct4gKvajka2GY9xdhHPhM6TRHwu1uPofr9aGnso6L99CKL9BI/TR4JcxVPr2hWQ=="
```

All of the xtm-helper scripts refer to this curl config file.
