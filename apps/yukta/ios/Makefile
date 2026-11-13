setup:
	@echo "Installing XcodeGen..."
	brew install xcodegen
	@echo "Copying config templates..."
	cp -n Configs/Debug.xcconfig.template Configs/Debug.xcconfig 2>/dev/null || true
	cp -n Configs/Release.xcconfig.template Configs/Release.xcconfig 2>/dev/null || true
	@echo "Generating Xcode project..."
	xcodegen generate
	@echo "Done. Set DEVELOPMENT_TEAM in Configs/Debug.xcconfig, then open Yukta.xcodeproj."

generate:
	xcodegen generate

# The scoring engine's tests: no simulator, runs on macOS and Linux.
test-kit:
	cd YuktaKit && swift test

clean:
	rm -rf DerivedData
	rm -rf .build YuktaKit/.build

.PHONY: setup generate test-kit clean
