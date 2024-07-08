#import "HideDockAppSwitcher.h"

%hook SBMainSwitcherViewController
- (bool)isMainSwitcherVisible {
	bool origValue = %orig;
	if (origValue) {
		[[[%c(SBIconController) sharedInstanceIfExists] floatingDockController] _dismissFloatingDockIfPresentedAnimated:YES completionHandler:nil];
	}
	else{
		[[[%c(SBIconController) sharedInstanceIfExists] floatingDockController] _presentFloatingDockIfDismissedAnimated:YES completionHandler:nil];
	}
	return origValue;
}
%end