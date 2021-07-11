# Test & Commit Checklist

This is the workflow for new releases

* **Change Phase**
    * Create new Function, new Module, make changes to existing, or implement fixes
    * Record changes in change logs for the respective module or modules
    * Generate new Manifest files
        * Include new exported functions
        * Update required module versions for the AdminToolbox module

* **Test Phase**
    * Copy updated modules to PSPortable and PSPortableLight
        * Commit Change to the PSPortable and PSPortableLight Repositories
        * Download updated psportable package
        * Test Changes
        * Repeat previous steps as required to get a stable build

* **Commit Phase**
    * If a new function was added or any changes made to Markdown help files use PlatyPS to update them
    * Commit changes to the AdminToolbox Repository
    * Monitor for successful a successful workflow
    * If the workflow fails, resolve and repeat any of the above needed steps