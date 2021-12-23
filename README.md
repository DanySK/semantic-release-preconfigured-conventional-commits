# Pre-configured shareable Semantic Release configuration for conventional commits

This is a ready-to-use, pre-defined configuration for [semantic-release](https://www.npmjs.com/package/semantic-release),
based on [semantic-release-conventional-commits](https://github.com/elliotttf/semantic-release-conventional-commits#readme).

To use this configuration, add to your `package.json`:

```json
  "devDependencies": {
    "semantic-release-preconfigured-conventional-commits": "latest"
  }
```
(actually, pick the latest stable version)

Then, pick the one among these three alternatives that suits your project:

### Alternative 1: `.releaserc.yml`

```yaml
extends:
  - semantic-release-preconfigured-conventional-commits
```

### Alternative 2: `.releaserc.json`

```json
{
    "extends": [
        "semantic-release-preconfigured-conventional-commits"
    ]
}
```

### Alternative 3: `package.json`

```json
{
    "release": {
        "extends": [
            "semantic-release-preconfigured-conventional-commits"
        ]
    }
}
```

### Configuration

* `feat` triggers a new minor release
* `fix`, `docs`, and `perf` trigger a new patch release

In the changelog:

* `feat` populates the section **New Features**
* `fix` populates the section **Bug fixes**
* `docs` populates the section **Documentation**
* `perf` populates the section **Performance improvements**
* `test` populates the section **Testing**
* `ci` and `build` populate the section **Build and continuous integration**
* `chore`, `style`, and `refactor` populate the section **Other changes**

## Proposing changes

I gladly consider changes to the configuration.
In case you think something is missing or deserves to be changed,
[open an issue](https://github.com/DanySK/semantic-release-preconfigured-conventional-commits/issues).
