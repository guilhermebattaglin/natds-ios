.DEFAULT_GOAL := help
BUNDLE=$(if $(rbenv > /dev/null), rbenv exec bundle, bundle)
FASTLANE=$(BUNDLE) exec fastlane

setup: ## intalls project dependencies
	cd scripts && ./setup.sh all && cd ..

	brew install rbenv
	rbenv install 2.6.5

	gem install bundler
	
	brew install git-lfs
	git lfs install
	
	make install_bundle

	@echo "\033[1;33m"
	@echo "-----------------------------------------------------------"
	@echo "Restart all your terminals to ensure the setup takes effect"
	@echo "-----------------------------------------------------------"
	@echo "\033[0m"

install_bundle: ## install gems
	$(BUNDLE) install

xcode_wipe: ## delete all xcode cached outputs, kill and reset all simulators
	-rm -rf ~/Library/Developer/Xcode/{DerivedData,Archives,Products}
	make reset_simulator

reset_simulator: ## reset all iOS Simulators
	-osascript -e 'tell application "Simulator" to quit'
	-xcrun simctl shutdown all
	-xcrun simctl erase all

pods_wipe: ## removes Pods folder, clean its cache and reinstall all Cocoapods dependencies
	pod cache clean --all
	rm -rf Pods
	rm -rf Podfile.lock
	rm -rf ~/Library/Caches/CocoaPods/*
	$(FASTLANE) pods_install

install_certificates: ## fetch and install certificates for code signing
	$(FASTLANE) fetch_certificates

test: ## run unit tests
	$(FASTLANE) test

build_ipa: ## builds the ipa file for environment (Ad Hoc)
	$(FASTLANE) build_ipa

release_alpha: ## builds the app using scheme and sends it to Test Flight
	$(FASTLANE) release_alpha

update_patch: ## Updates SampleApp and DS Lib versions with next Patch (Y.Y.X) number, also tag and commit.
	$(FASTLANE) update_patch

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'