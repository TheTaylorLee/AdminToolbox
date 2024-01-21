## Contributing

**Contribution Guidelines**

- An issue should be opened prior to any work being done. Use one of the existing templates.
- Create a fork or branch off the master branch.
- Modify, fix, or add code that pertains to the issue only.
- When creating a pull request reference the issue number.
- If the committed changes increment a module version, update that modules ChangeLog.md file. This is important so that the workflow responsible for publishing new versions to PowerShell Gallery, can run on approved pull requests.
- Code will be reviewed and committed to the master branch, or comments will be added to the issue if problems are found.

**Coding Guidelines**

- If you add a function, update the `Get-<ModuleName>` public function to include that new function. In the comments for that function follow the format for existing functions.
- If a public function was added, it will need to be exported in the module manifest. The function name can be added to the existing manifest workflow script .github\workflows\scripts\New-Manifest.ps1
- All code should be written verbosely by avoiding aliases and shortcuts.

**Documentation and Commit Guidelines**

- All added functions should contain comment help block above the function. Follow the comment block with a single space, so get-help can reference the comment block.
- platyps will be run by a workflow to update the repository docs.

#### Commit format
- Type:Module - Description

- ALLOWED type VALUES:

    Type | Description
    ---------|----------
    build | A change to the overall structure of a module
    ci | changes to CI/CD
    docs | Documentation Changes
    feat | A new feature
    fix | A bug fix
    func | New function
    note | If the commit doesn't fall into other categories, this allows for a free hand description
    rel | New module release versions
    test | Testing changes

**Version Guidelines**
MAJOR.MINOR.REVISION

MAJOR: Adding multiple new functions or major refactoring of a module \
MINOR: Adding or updating few functions that don't result in functional changes to a module \
REVISION: is usually a fix for a previous minor release (no new functionality).
