---
name: tsconfig-default
description: "typescript config defaults"
metadata:
  tags: typescript, default, data
---

## When to use

Everytime a project is created

## Example tsconfig.json

`tsconfig.json`:

```
{
  "compilerOptions": {
    "ignoreDeprecations": "6.0",
    "target": "es6",
    "lib": ["dom", "dom.iterable", "esnext"],
    "module": "esnext",
    "moduleResolution": "node",
    "jsx": "react-jsx", // oppure "react-jsxdev" se in sviluppo
    "types": ["react", "react-dom", "node", "jest"], // importante!
    "strict": true,
    "noImplicitAny": true,
    "esModuleInterop": true,
    "allowSyntheticDefaultImports": true,
    "resolveJsonModule": true,
    "isolatedModules": true,
    "skipLibCheck": true,
    "outDir": "./dist", // 👈 output JS in dist/
    "rootDir": "./", // 👈 solo compila da src/
    "noEmit": false, // 👈 abilita l'emissione dei .js,
    "strictNullChecks": false,
    "baseUrl": "./",
    "paths": {
      "@/*": ["src/*"],
      "@testUtils/*": ["testUtils/*"] // 👈 aggiungi questo
    },
    "typeRoots": ["./types", "./node_modules/@types"]
  },
  "include": ["src", "global.d.ts"],
  "exclude": ["node_modules", "dist"]
}
```
