## xtm-helper

`xtm-helper` is a set of shell scripts that you can use to interact with [XTM](https://xtm.cloud) from the command line.

Each shell script uses the [curl](https://curl.haxx.se/) command to call a method in [XTM's REST API](https://www.xtm-cloud.com/rest-api/).

### List of Scripts

#### List Projects

```
xtm-list-projects.bash
```

#### Upload Project Files

```
xtm-upload.rb -p `<project-id>` -d `<directory-path>`
```

Proceed to on the [`xtm-upload`](https://ehom.github.io/xtm-helper/xtm-upload/) page for more info.

Run `xtm-list-projects.bash` to look up the id of the project.

#### Download Project Files

```
xtm-download-proj-files.bash <project-id>
```

Run `xtm-list-projects.bash` to look up the id of the project.

### Before using the xtm-helper scripts

You will need to generate an XTM access token.

Edit the script `xtm-generate-token.bash`, setting the following fields:

* userId
* password
* customer name

```
$ cat xtm-generate-token.bash

#!/usr/bin/env bash

# You may need to change the base URL if you are using a sandbox.

XTM_BASE_URL=https://www.xtm-cloud.com/project-manager-api-rest

curl --silent \
    --data '{"client":"Acme", "password":"12345678", "userId": 88}' \
    --header "Content-Type: application/json" \
    $XTM_BASE_URL/auth/token | json_pp

```

After you save the changes to the file, run `xtm-generate-token.bash`.

```
$ ./xtm-generate-token.bash
{
   "token" : "vv0h/0J6enimWR5IRXby+Chct4gKvajka2GY9xdhHPhM6TRHwu1uPofr9aGnso6L99CKL9BI/TR4JcxVPr2hWQ=="
}
```

Create a file named "xtm-access-token.txt". This file is referred to as our "curl config file".

```
$ touch xtm-access-token.txt

```

Copy the value of access token above and paste it in our curl config file.

```
$ cat xtm-access-token.txt

header: "Authorization: XTM-Basic vv0h/0J6enimWR5IRXby+Chct4gKvajka2GY9xdhHPhM6TRHwu1uPofr9aGnso6L99CKL9BI/TR4JcxVPr2hWQ=="
```

All of the `xtm-helper` scripts refer to this curl config file.

This file needs to be located here: `~/.xtm-helper/xtm-access-token.txt`

