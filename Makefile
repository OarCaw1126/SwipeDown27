TARGET := iphone:clang:latest:14.0
ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SwipeDown27

SwipeDown26_FILES = Tweak.x Shared/LGSharedSupport.m Shared/LGHookSupport.m Shared/LGBannerCaptureSupport.m Shared/LGMetalShaderSource.m Shared/LGGlassRenderer.m Shared/LGBackButtonSupport.m Shared/LGRWBSupport.m Runtime/LGLiquidGlassRuntime.m Runtime/LGSnapshotCaptureSupport.m
SwipeDown26_FRAMEWORKS = UIKit Foundation SwiftUI AVFoundation Accelerate MetalKit

include $(THEOS_MAKE_PATH)/tweak.mk
