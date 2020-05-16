LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE     := xhook
LOCAL_SRC_FILES  := libxhook/jni/xhook.c \
                    libxhook/jni/xh_core.c \
                    libxhook/jni/xh_elf.c \
                    libxhook/jni/xh_jni.c \
                    libxhook/jni/xh_log.c \
                    libxhook/jni/xh_util.c \
                    libxhook/jni/xh_version.c
LOCAL_C_INCLUDES := $(LOCAL_PATH)/libxhook/jni
LOCAL_CFLAGS     := -Wall -Wextra -Werror -fvisibility=hidden
LOCAL_CONLYFLAGS := -std=c11
LOCAL_LDLIBS     := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE            := biz
LOCAL_SRC_FILES         := libbiz/jni/biz.c
LOCAL_SHARED_LIBRARIES  := xhook
LOCAL_CFLAGS            := -Wall -Wextra -Werror
LOCAL_CONLYFLAGS        := -std=c11
LOCAL_LDLIBS            := -llog
include $(BUILD_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE     := test
LOCAL_SRC_FILES  := libtest/jni/test.c
LOCAL_CFLAGS     := -Wall -Wextra -Werror -O0
LOCAL_CONLYFLAGS := -std=c11
LOCAL_LDLIBS     := -llog
include $(BUILD_SHARED_LIBRARY)