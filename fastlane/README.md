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
### test
```
fastlane test
```
Description of what the lane does
### beta
```
fastlane beta
```
Upload build to TestFlight
### screenshots
```
fastlane screenshots
```

### upload_all_metadata
```
fastlane upload_all_metadata
```
Upload text metadata and screenshots
### upload_text_metadata
```
fastlane upload_text_metadata
```
Upload only text metadata
### commit_tag_version_bump
```
fastlane commit_tag_version_bump
```

### translate
```
fastlane translate
```


----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.
More information about fastlane can be found on [fastlane.tools](https://fastlane.tools).
The documentation of fastlane can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
