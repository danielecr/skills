---
name: node-commonjs-to-esm
description: "port node project from commonjs to ECMAScript Module loading"
metadata:
  tags: esm, commonjs, nodejs, javascript, module
---

## When to use

Port legacy code in commonjs to esm module.

## Basic operations

First change the package.json adding `"type": "module"`

## Require -> import ... from

Start from index.js, or from what is specified as main in package.json
Then rewrite each local requires, from:

> const x = require("./local/module_path");

to:

> import default as x from './local/module_path.js';

All dependency requires from:

> const x = require("module");

To:

> import default as x from 'module';

The details here is the ".js" extension specified in import fro local staff

## Define `__dirname`

`__dirname` is not defined in esm mode, so, in each module it is used, define it
in the higher level of the module scope, by using path and url:

```
import path from 'path';
import { fileURLToPath } from 'url';
const __dirname = path.dirname(fileURLToPath(import.meta.url));
```

## import commonjs modules

Importing module not supporting esm, is done by taking default, and destructuring it:

```
import * as sswfound from 'ssw-foundation';
let {getresponder, requester, queryH:queryH} = sswfound.default;
```

## Import JSON file into an object

Code:

> let data = require('./file.json');

Become:

```
const requireJSON = (filename) => {
    let filePath = path.resolve(__dirname, filename);
    let fileContent = fs.readFileSync(filePath, 'utf-8');
    try {
        let data = JSON.parse(fileContent);
        return data;
    } catch (err) {
        console.error('Error parsing JSON from file: ', filePath, err);
        throw err;
    }
}
const running_status = requireJSON('./running_status_ex.json');
```


