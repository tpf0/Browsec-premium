#import <UIKit.h>
#import <substrate.h>

// Enable premium server

%hook BSCurrentSubscription
-(bool)isFreePremium {
  return TRUE;
}
%end


%hook BSCurrentSubscription
-(bool)isActive {
  return TRUE;
}
%end


%hook BSAnalyticEventSubscription
-(void)setSuccess:(bool)arg1 {
  arg1 = TRUE;
  %orig(arg1);
}
%end

%hook BSFreePremiumService
-(bool)isAvailable {
  return TRUE;
}
%end

%hook BSServer
-(bool)isPremium {
  return FALSE;
}
}

-(void)setIsPremium:(bool)arg1 {
  arg1 = FALSE;
  %orig(arg1);
}
%end

%hook BSCountry
-(void)setHasPremiumServers:(bool)arg1 {
  arg1 = TRUE;
  %orig(arg1);
}
%end

%hook BSCountry
-(bool)hasPremiumServers {
  return TRUE;
}
%end
