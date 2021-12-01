fastlane documentation
================
# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```
xcode-select --install
```

Install _fastlane_ using
```
[sudo] gem install fastlane -NV
```
or alternatively using `brew install fastlane`

# Available Actions
## iOS
### ios test
```
fastlane ios test
```
Description of what the lane does
### ios beta
```
fastlane ios beta
```
Upload build to TestFlight
### ios screenshots
```
fastlane ios screenshots
```

### ios upload_all_metadata
```
fastlane ios upload_all_metadata
```
Upload text metadata and screenshots
### ios upload_text_metadata
```
fastlane ios upload_text_metadata
```
Upload only text metadata
### ios commit_tag_version_bump
```
fastlane ios commit_tag_version_bump
```

### ios translate
```
fastlane ios translate
```


----

This README.md is auto-generated and will be re-generated every time [fastlane](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
