TWEAK_NAME = SwipeDown27
LG_PACKAGE_VERSION := $(shell sed -n 's/^Version: //p' control | head -n 1)
LG_BUILD_TIMESTAMP := $(shell date -u '+%Y-%m-%dT%H:%M:%SZ')

SHARED_FILES := Shared/LGSharedSupport.m Shared/LGHookSupport.m Shared/LGBannerCaptureSupport.m Shared/LGMetalShaderSource.m Shared/LGGlassRenderer.m Shared/LGBackButtonSupport.m Shared/LGRWBSupport.m
RUNTIME_FILES := Runtime/LGLiquidGlassRuntime.m Runtime/LGSnapshotCaptureSupport.m
PREF_CONTROL_FILES := LiquidAssPrefs/LGPrefsLiquidSlider.m LiquidAssPrefs/LGPrefsLiquidSwitch.m

$(TWEAK_NAME)_FILES = Tweak.x LiquidGlass.H $(SHARED_FILES) $(RUNTIME_FILES) $(PREF_CONTROL_FILES)
