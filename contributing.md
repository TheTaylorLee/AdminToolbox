## Contributing

**Contribution Guidelines**

- An issue should be opened prior to any work being done. State that you will be contributing in the issue, and what you intend to change.
- Create a fork or branch off the master branch.
- Modify, fix, or add code that pertains to the issue only.
- When creating a pull request reference the issue number.
- If the committed changes increment a module version, update that modules ChangeLog.md file. This is important so that the workflow responsible for publishing new versions to PowerShell Gallery can run on accepted pull requests.
- Code will be reviewed and committed to the master branch, or comments will be added to the issue if problems are found.

**Coding Guidelines**

- If you add a function, update the `Get-<ModuleName>` public function to include that new function. In the comments for that function follow the format for existing functions.
- All code should be written verbosely. Do not use Aliases or shortcuts.

**Documentation Guidelines**

- If a commit upgrades the version of a module, it should be in the commit comment.
- All added functions should contain comment help above the function, with a single space, so get-help can reference the comment block.
- A workflow will update markdown based help in the docs folder. There is no longer a need to do so manually on new commits.

**Commit and Changelog Guidelines**
### Type:Module - Description

### ALLOWED type VALUES:
Value | Description
---------|----------
build | A change to the overall structure of a module
ci | changes to CI/CD
docs | Documentation Changes
feat | A new feature
fix | A bug fix
func | New function
rel | New module release versions
test | Testing changes

### Allowed Module values
- AdminToolbox
- AdminToolbox.ActiveDirectory
- AdminToolbox.EndpointManagement
- AdminToolbox.Exchange
- AdminToolbox.FFTools
- AdminToolbox.FileManagement
- AdminToolbox.FortiWizard
- AdminToolbox.Fun
- AdminToolbox.Networking
- AdminToolbox.Office365
- AdminToolbox.Remoting
- AdminToolbox.VMWareAutomate

**Version Guidelines**
MAJOR.MINOR.REVISION

MAJOR: Adding multiple new functions or major refactoring of a module \
MINOR: Adding or updating few functions that don't result in functional changes to a module \
REVISION: is usually a fix for a previous minor release (no new functionality).