# vcpkg-ports

Chlorie's custom vcpkg ports.

## Usage

Enable `registries` feature flag in vcpkg and write a `vcpkg-configuration.json` file like this in your project's root directory, and you're good to go.

```json
{
    "registries": [
        {
            "kind": "git",
            "repository": "https://github.com/Chlorie/vcpkg-ports", 
            "path": "/ports",
            "packages": [ <insert packages here> ]
        }
    ]
}
```
