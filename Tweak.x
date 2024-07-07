#import "HideDockAppSwitcher.h"

%hook SBMainSwitcherViewController
- (bool)isMainSwitcherVisible {
//	works but triggers after switcher is visible - using this one to prevent reappearing of dock when grid switcher is opened from today/spotlight/library
	bool origValue = %orig;
	if (origValue) {
		[[[%c(SBIconController) sharedInstanceIfExists] floatingDockController] _dismissFloatingDockIfPresentedAnimated:YES completionHandler:nil];
	}
	return origValue;
}
%end