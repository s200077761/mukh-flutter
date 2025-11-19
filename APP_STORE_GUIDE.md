# Mukh Flutter - App Store Publishing Guide

هذا الدليل يشرح خطوات نشر تطبيق Mukh على App Store iOS.

## المتطلبات الأساسية

1. **حساب Apple Developer** - اشتراك سنوي ($99)
2. **Xcode 14.0 أو أحدث**
3. **macOS 12 أو أحدث**
4. **CocoaPods**
5. **Flutter SDK 3.24.0 أو أحدث**

## الخطوة 1: إعداد حساب Apple Developer

1. اذهب إلى https://developer.apple.com
2. قم بتسجيل الدخول أو إنشاء حساب جديد
3. ادفع رسوم الاشتراك السنوية ($99)
4. وافق على اتفاقيات Apple

## الخطوة 2: إنشاء App ID

1. اذهب إلى [App IDs](https://developer.apple.com/account/resources/identifiers/list)
2. انقر على "+"
3. اختر "App IDs"
4. اختر "App"
5. ملأ المعلومات:
   - **Name**: Mukh
   - **Bundle ID**: com.mukh.app
   - **Capabilities**: 
     - Push Notifications
     - Network Extension
6. انقر "Continue" ثم "Register"

## الخطوة 3: إنشاء Provisioning Profile

1. اذهب إلى [Provisioning Profiles](https://developer.apple.com/account/resources/profiles/list)
2. انقر على "+"
3. اختر "App Store"
4. اختر App ID الذي أنشأته (com.mukh.app)
5. اختر شهادة التوقيع
6. أدخل اسم Profile: "Mukh App Store"
7. حمّل الملف وثبّته

## الخطوة 4: إعداد Xcode

1. افتح المشروع في Xcode:
```bash
open ios/Runner.xcworkspace
```

2. اختر "Runner" من الـ Project Navigator

3. اذهب إلى "Signing & Capabilities":
   - **Team**: اختر فريقك
   - **Bundle Identifier**: com.mukh.app
   - **Version**: 1.0.0
   - **Build**: 1

4. تأكد من أن "Automatically manage signing" مفعّل

## الخطوة 5: تحديث معلومات التطبيق

### في Xcode:

1. اختر "Runner" → "General"
2. حدّث المعلومات:
   - **Display Name**: Mukh
   - **Bundle Identifier**: com.mukh.app
   - **Version**: 1.0.0
   - **Build**: 1

3. اذهب إلى "Info" tab وأضف:
```xml
<key>NSLocalNetworkUsageDescription</key>
<string>Mukh needs local network access for communication</string>
<key>NSBonjourServices</key>
<array>
  <string>_http._tcp</string>
  <string>_https._tcp</string>
</array>
```

## الخطوة 6: إضافة الأيقونة والصور

### أيقونة التطبيق:

1. اذهب إلى `ios/Runner/Assets.xcassets/AppIcon.appiconset`
2. استبدل الأيقونات بالأحجام المطلوبة:
   - 1024x1024 (للـ App Store)
   - 180x180 (للـ iPhone)
   - 167x167 (للـ iPad Pro)
   - 152x152 (للـ iPad)
   - 120x120 (للـ iPhone)
   - 87x87 (للـ iPhone)
   - 80x80 (للـ iPhone)
   - 76x76 (للـ iPad)
   - 40x40 (للـ iPhone)
   - 29x29 (للـ iPhone)
   - 20x20 (للـ iPhone)

### صور الـ Launch Screen:

1. اذهب إلى `ios/Runner/Assets.xcassets/LaunchImage.imageset`
2. استبدل الصور

## الخطوة 7: بناء الإصدار النهائي

```bash
# تنظيف المشروع
flutter clean

# تحميل المكتبات
flutter pub get

# بناء iOS Release
flutter build ios --release
```

## الخطوة 8: إنشاء Archive

1. افتح Xcode:
```bash
open ios/Runner.xcworkspace
```

2. اختر "Product" → "Scheme" → "Runner"

3. اختر "Product" → "Build For" → "Running"

4. اختر "Product" → "Archive"

5. انتظر اكتمال البناء

## الخطوة 9: رفع على App Store Connect

1. بعد اكتمال Archive، سيفتح "Organizer"

2. اختر الـ Archive الأخير

3. انقر "Distribute App"

4. اختر "App Store Connect"

5. اختر "Upload"

6. اختر فريقك وحسابك

7. اختر "Automatically manage signing"

8. انقر "Next" وأكمل العملية

## الخطوة 10: ملء معلومات التطبيق على App Store Connect

1. اذهب إلى [App Store Connect](https://appstoreconnect.apple.com)

2. اختر تطبيقك "Mukh"

3. اذهب إلى "App Information":
   - **App Name**: Mukh
   - **Subtitle**: AI Chatbot
   - **Description**: 
     ```
     Mukh is a lightweight AI chatbot powered by Hugging Face.
     
     Features:
     - Real-time conversations with AI
     - Multiple chat sessions
     - Beautiful dark theme UI
     - Fast and responsive
     - Secure communication
     
     Start chatting with Mukh today!
     ```
   - **Keywords**: AI, chatbot, conversation, hugging face
   - **Support URL**: https://github.com/s200077761/mukh-flutter
   - **Privacy Policy URL**: https://example.com/privacy

4. اذهب إلى "Pricing and Availability":
   - اختر "Free"
   - اختر الدول المتاحة

5. اذهب إلى "General App Information":
   - **Category**: Productivity
   - **Content Rating**: اختر الإجابات المناسبة

6. اذهب إلى "App Preview and Screenshots":
   - أضف صور للتطبيق (يجب أن تكون بجودة عالية)
   - أضف وصف لكل صورة

## الخطوة 11: الإرسال للمراجعة

1. اذهب إلى "Version Release":
   - اختر "Prepare for Submission"

2. تأكد من أن كل شيء مكتمل (علامات خضراء)

3. انقر "Submit for Review"

4. اختر "Yes" للأسئلة الأمنية

5. انقر "Submit"

## مدة المراجعة

- عادة: 24-48 ساعة
- في بعض الأحيان: حتى 5 أيام

## بعد الموافقة

1. ستتلقى بريد إلكتروني بالموافقة
2. التطبيق سيظهر على App Store تلقائياً
3. يمكنك تتبع الإحصائيات على App Store Connect

## نصائح مهمة

- ✅ تأكد من أن جميع الصور بجودة عالية
- ✅ اكتب وصف واضح وجذاب
- ✅ اختبر التطبيق جيداً قبل الإرسال
- ✅ تأكد من توافق الخصوصية
- ✅ استخدم أيقونة احترافية
- ✅ اختبر على أجهزة حقيقية

## استكشاف الأخطاء

### خطأ: "Invalid Provisioning Profile"
- تأكد من أن الـ Bundle ID يطابق في Xcode و App Store Connect
- أعد تحميل الـ Provisioning Profile

### خطأ: "Certificate not valid"
- تأكد من أن الشهادة لم تنته صلاحيتها
- أنشئ شهادة جديدة إذا لزم الأمر

### خطأ: "App rejected"
- اقرأ رسالة الرفض بعناية
- أصلح المشاكل المذكورة
- أعد الإرسال

## المراجع

- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [Flutter iOS Deployment](https://flutter.dev/docs/deployment/ios)
- [App Store Connect Help](https://help.apple.com/app-store-connect/)

---

تم إعداد هذا الدليل لمشروع Mukh Flutter
