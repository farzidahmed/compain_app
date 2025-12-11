# Keep class names used in reflection
-keep class * extends android.app.Activity
-keep class * extends android.app.Service
-keep class * extends android.content.BroadcastReceiver

# Keep WebView classes
-keep class android.webkit.** { *; }

# Keep Flutter classes
-keep class io.flutter.** { *; }