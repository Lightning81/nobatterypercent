#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>




%hook SBUIController
- (int) batteryCapacityAsPercentage;
      (_bool)_isVisible;
}
%end

%hook UIStatusBarBatteryPercentViewItem
  -(float) batteryPercentage {
          [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
          if ([[UIDevice currentDevice] batteryState] == UIBatteryStateCharging ||
              [[UIDevice currentDevice] batteryState] == UIDeviceBatteryStateFull) {
                return 3;
              }
                return %orig;
  }

  %end


  %hook SBUIController
  - (void)ACPowerChanged {
    //TODO refresh status bar once device is plugged in/out
    %orig
  }
%end
