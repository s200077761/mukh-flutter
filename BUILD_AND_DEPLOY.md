# بناء ونشر تطبيق Mukh Flutter

هذا الملف يحتوي على تعليمات مفصلة لبناء ونشر تطبيق Mukh على iOS و Android.

## المتطلبات

- Flutter SDK 3.24.0 أو أحدث
- Dart 3.5.0 أو أحدث
- Xcode 14.0 أو أحدث (لـ iOS)
- Android Studio (لـ Android)
- CocoaPods (لـ iOS)

## بناء التطبيق

### 1. تنظيف المشروع

```bash
flutter clean
```

### 2. تحميل المكتبات

```bash
flutter pub get
```

### 3. بناء iOS Release

```bash
flutter build ios --release
```

### 4. بناء Android Release

```bash
flutter build apk --release
```

أو لـ App Bundle:

```bash
flutter build appbundle --release
```

## نشر على iOS App Store

### المتطلبات الإضافية

- حساب Apple Developer ($99/سنة)
- شهادة توقيع صحيحة
- Provisioning Profile

### الخطوات

1. **فتح المشروع في Xcode:**
```bash
open ios/Runner.xcworkspace
```

2. **تحديث معرف التطبيق:**
   - اختر "Runner" من Project Navigator
   - اذهب إلى "General"
   - حدّث Bundle Identifier إلى `com.mukh.app`

3. **تحديث معلومات الإصدار:**
   - Version: 1.0.0
   - Build: 1

4. **إضافة الأيقونة:**
   - ضع أيقونة 1024x1024 في `ios/Runner/Assets.xcassets/AppIcon.appiconset/`

5. **بناء Archive:**
   - Product → Archive
   - انتظر اكتمال البناء

6. **رفع على App Store:**
   - في Organizer: اختر Archive الأخير
   - Distribute App → App Store Connect
   - اتبع التعليمات

7. **ملء معلومات التطبيق:**
   - اذهب إلى App Store Connect
   - أضف الوصف والصور والكلمات المفتاحية
   - اختر الفئة والتصنيف

8. **الإرسال للمراجعة:**
   - Submit for Review
   - انتظر الموافقة (عادة 24-48 ساعة)

## نشر على Google Play Store

### المتطلبات الإضافية

- حساب Google Play Developer ($25 لمرة واحدة)
- مفتاح توقيع APK

### الخطوات

1. **إنشاء مفتاح التوقيع:**
```bash
keytool -genkey -v -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

2. **تحديث `android/key.properties`:**
```properties
storePassword=<password>
keyPassword=<password>
keyAlias=key
storeFile=<path to key.jks>
```

3. **بناء App Bundle:**
```bash
flutter build appbundle --release
```

4. **رفع على Google Play Console:**
   - اذهب إلى Google Play Console
   - اختر "Mukh"
   - اذهب إلى "Release" → "Production"
   - أرفع App Bundle
   - أضف الوصف والصور والكلمات المفتاحية
   - اختر الفئة والتصنيف
   - اضغط "Review and roll out"

## اختبار التطبيق

### على iOS Simulator:

```bash
flutter run -d iPhone
```

### على Android Emulator:

```bash
flutter run -d emulator-5554
```

### على جهاز حقيقي:

```bash
flutter run
```

## استكشاف الأخطاء

### خطأ: "Pod install failed"

```bash
cd ios
pod repo update
pod install
cd ..
```

### خطأ: "Signing certificate not found"

- تأكد من أن الشهادة موجودة في Keychain
- أنشئ شهادة جديدة إذا لزم الأمر

### خطأ: "Build failed"

```bash
flutter clean
flutter pub get
flutter build ios --release
```

## نصائح الأداء

1. استخدم `--split-debug-info` لتقليل حجم الـ APK
2. استخدم `--obfuscate` لتشفير الكود
3. اختبر على أجهزة حقيقية قبل النشر
4. استخدم Profiler لقياس الأداء

## الإصدارات المستقبلية

لإصدار نسخة جديدة:

1. حدّث رقم الإصدار في `pubspec.yaml`
2. حدّث رقم البناء
3. أضف ملاحظات الإصدار
4. اتبع نفس خطوات البناء والنشر

## المراجع

- [Flutter iOS Deployment](https://flutter.dev/docs/deployment/ios)
- [Flutter Android Deployment](https://flutter.dev/docs/deployment/android)
- [App Store Connect Help](https://help.apple.com/app-store-connect/)
- [Google Play Console Help](https://support.google.com/googleplay/android-developer)

---

تم إعداد هذا الملف لمشروع Mukh Flutter
