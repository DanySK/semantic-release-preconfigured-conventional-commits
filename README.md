# Pre-configured shareable Semantic Release configuration for conventional commits

This is a ready-to-use, pre-defined configuration for [semantic-release](https://www.npmjs.com/package/semantic-release),
meant to support the use of [conventional commits](https://www.conventionalcommits.org/) along with [Whitesource Renovate](https://github.com/renovatebot/renovate).

## Configuration

#### **MAJOR** release
* Any commit type and scope terminating with `!` causes a `BREAKING CHANGE`

#### **MINOR** release
* Commit type `chore` with scope `api-deps` (*Dependency updates*)
* Commit type `feat` (*Features*) with any scope

#### **PATCH** release
* Commit type `chore` with scope `core-deps` (*Dependency updates*)
* Commit type `fix` (*Bug Fixes*) with any scope
* Commit type `docs` (*Documentation*) with any scope
* Commit type `perf` (*Performance improvements*) with any scope
* Commit type `revert` (*Revert previous changes*) with any scope

#### No release
* Commit type `test` (*Tests*)
* Commit type `ci` (*Build and continuous integration*)
* Commit type `build` (*Build and continuous integration*)
* Commit type `chore` with scope `deps` (*Dependency updates*)
* Commit type `chore` (*General maintenance*) with scopes different than the ones mentioned above 
* Commit type `style` (*Style improvements*) with any scope 
* Commit type `refactor` (*Refactoring*) with any scope 

## Usage

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

## Proposing changes

I gladly consider changes to the configuration.
In case you think something is missing or deserves to be changed,
[open an issue](https://github.com/DanySK/semantic-release-preconfigured-conventional-commits/issues).
