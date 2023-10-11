# vcpkg-ports

Chlorie's custom vcpkg ports.

## How to use

The easiest way to use my custom port registry is to enable [manifest mode](https://learn.microsoft.com/en-us/vcpkg/consume/manifest-mode) for your project. An example is like this:

```json
{
    "$schema": "https://raw.githubusercontent.com/microsoft/vcpkg-tool/main/docs/vcpkg.schema.json",
    "name": "my-awesome-project",
    "version-string": "0.1.0",
    "dependencies": ["clu", "fmt"]
}
```

Then, you also need to write a [`vcpkg-configuration.json`](https://learn.microsoft.com/en-us/vcpkg/reference/vcpkg-configuration-json) file referencing this repository. An example:

```json
{
    "$schema": "https://raw.githubusercontent.com/microsoft/vcpkg-tool/main/docs/vcpkg-configuration.schema.json",
    "default-registry": {
        "kind": "git",
        "baseline": "cc97b4536ae749ec0e4f643488b600b217540fb3",
        "repository": "https://github.com/microsoft/vcpkg"
    },
    "registries": [
        {
            "kind": "git",
            "baseline": "482edae84a774f1d1994c9ce1b0e51277c0f785b",
            "repository": "https://github.com/Chlorie/vcpkg-ports",
            // You need to list all the *transitive* dependencies you need from my registry here
            "packages": ["clu"]
        }
    ]
}
```

**Note:** You need to list all the *transitive* dependencies from my custom registry in the `packages` field. For example, if you need the `hikari` library from my ports, since `hikari` depends on `clu`, which is also in my registry, you need to list both `clu` and `hikari` in the `packages` field.

Since `vcpkg` forces the use of exact baselines, you must fill in valid commit refs in the respective fields there (or just use the example above). To update the baselines to the latest commit, see the next part.

## Updating packages

Open your favorite terminal in the project root directory, and then run 

```sh
vcpkg x-update-baseline
```

This command will fetch the latest commit of all the registries specified in your `vcpkg-configuration.json` and update the refs accordingly.
