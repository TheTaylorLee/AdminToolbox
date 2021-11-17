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

- If a commit upgrades the version on a module, it should be in the commit comment.
- All added functions should contain comment help above the function, with a single space, so get-help can reference the comment block.
- A workflow will update markdown based help in the docs folder. There is no longer a need to do so manually on new commits.