# دليل شامل لرفع تطبيق Mukh على Apple App Store

**التاريخ:** نوفمبر 2025  
**الإصدار:** 1.0.0  
**رقم البناء:** 1

---

## المرحلة الأولى: التحضيرات الأساسية

### 1. تثبيت المتطلبات

قبل البدء، تأكد من توفر:

- **macOS 12.0 أو أحدث** - نظام التشغيل
- **Xcode 14.0 أو أحدث** - بيئة التطوير
- **Flutter SDK 3.24.0** - تم التحقق منه ✅
- **Dart 3.5.0** - تم التحقق منه ✅
- **CocoaPods** - مدير المكتبات

### 2. حساب Apple Developer

تأكد من:
- ✅ حساب Apple Developer نشط
- ✅ دفع رسوم الاشتراك السنوية ($99)
- ✅ الموافقة على اتفاقيات Apple
- ✅ إنشاء Team ID

---

## المرحلة الثانية: إعداد معرف التطبيق (App ID)

### الخطوة 1: إنشاء App ID

1. اذهب إلى [Apple Developer Account](https://developer.apple.com/account)
2. انقر على "Certificates, Identifiers & Profiles"
3. اختر "Identifiers" من القائمة الجانبية
4. انقر على زر "+" لإنشاء معرف جديد
5. اختر "App IDs"
6. ملأ المعلومات:
   - **Type:** App
   - **Description:** Mukh - AI Chatbot
   - **Bundle ID:** com.mukh.app (Explicit)
   - **Capabilities:** Push Notifications, Network Extension

7. انقر "Continue" ثم "Register"

### الخطوة 2: إنشاء Provisioning Profile

1. اذهب إلى "Profiles" في نفس الصفحة
2. انقر على "+"
3. اختر "App Store"
4. اختر App ID الذي أنشأته (com.mukh.app)
5. اختر شهادة التوقيع الخاصة بك
6. أدخل اسم Profile: "Mukh App Store"
7. حمّل الملف وثبّته على جهازك

---

## المرحلة الثالثة: إعداد Xcode

### الخطوة 1: فتح المشروع

```bash
cd /path/to/mukh_flutter
open ios/Runner.xcworkspace
```

**ملاحظة مهمة:** استخدم `.xcworkspace` وليس `.xcodeproj`

### الخطوة 2: تحديث معلومات البناء

1. اختر "Runner" من Project Navigator
2. اذهب إلى "General" tab
3. حدّث المعلومات التالية:

| الحقل | القيمة |
|------|--------|
| Display Name | Mukh |
| Bundle Identifier | com.mukh.app |
| Version | 1.0.0 |
| Build | 1 |
| Minimum Deployments | iOS 12.0 |

### الخطوة 3: إعدادات التوقيع

1. اذهب إلى "Signing & Capabilities" tab
2. تأكد من:
   - ✅ "Automatically manage signing" مفعّل
   - ✅ Team مختار بشكل صحيح
   - ✅ Bundle ID يطابق com.mukh.app

### الخطوة 4: إضافة الأيقونة

1. اذهب إلى `ios/Runner/Assets.xcassets/AppIcon.appiconset`
2. استبدل الأيقونات بالأحجام المطلوبة:
   - 1024×1024 (App Store)
   - 180×180 (iPhone)
   - 167×167 (iPad Pro)
   - 152×152 (iPad)
   - 120×120 (iPhone)
   - 87×87 (iPhone)
   - 80×80 (iPhone)
   - 76×76 (iPad)
   - 40×40 (iPhone)
   - 29×29 (iPhone)
   - 20×20 (iPhone)

**ملاحظة:** الأيقونة الحالية موجودة في `assets/app_icon.png` (1024×1024)

---

## المرحلة الرابعة: بناء الإصدار النهائي

### الخطوة 1: تنظيف وتحضير المشروع

```bash
cd /path/to/mukh_flutter
flutter clean
flutter pub get
```

### الخطوة 2: بناء الإصدار

في Xcode:

1. اختر "Product" من القائمة العلوية
2. اختر "Scheme" → تأكد من اختيار "Runner"
3. اختر "Build For" → "Running"
4. انتظر اكتمال البناء

أو من سطر الأوامر:

```bash
cd ios
pod install --repo-update
cd ..
flutter build ipa --release
```

### الخطوة 3: إنشاء Archive

1. في Xcode، اختر "Product" → "Archive"
2. انتظر اكتمال البناء
3. سيفتح "Organizer" تلقائياً

---

## المرحلة الخامسة: رفع على App Store Connect

### الخطوة 1: التحقق من Archive

في Organizer:

1. تأكد من ظهور Archive الجديد
2. اختر أحدث Archive
3. انقر "Distribute App"

### الخطوة 2: اختيار طريقة التوزيع

1. اختر "App Store Connect"
2. اختر "Upload"
3. اختر فريقك
4. اختر "Automatically manage signing"
5. انقر "Next"

### الخطوة 3: المراجعة والتأكيد

1. تحقق من جميع المعلومات
2. انقر "Upload"
3. انتظر اكتمال الرفع (قد يستغرق 5-15 دقيقة)

---

## المرحلة السادسة: ملء معلومات التطبيق على App Store Connect

### الخطوة 1: الدخول إلى App Store Connect

اذهب إلى [App Store Connect](https://appstoreconnect.apple.com)

### الخطوة 2: معلومات التطبيق (App Information)

| الحقل | القيمة |
|------|--------|
| App Name | Mukh |
| Subtitle | AI Chatbot |
| Primary Language | English |
| Category | Productivity |

### الخطوة 3: الوصف (Description)

استخدم الوصف من `APP_STORE_CONTENT.md`:

```
مخ (Mukh) - مساعدك الذكي الشخصي

تطبيق مخ يتيح لك إجراء محادثات ذكية مع الذكاء الاصطناعي المتقدم...
```

### الخطوة 4: الكلمات المفتاحية (Keywords)

```
ذكاء اصطناعي,محادثة,مساعد,AI,chatbot,مخ,mukh,assistant,chat
```

### الخطوة 5: معلومات الدعم

| الحقل | القيمة |
|------|--------|
| Support URL | https://github.com/s200077761/mukh-flutter |
| Privacy Policy URL | https://github.com/s200077761/mukh-flutter/blob/main/PRIVACY_POLICY.md |

### الخطوة 6: معلومات التقييم (Rating)

1. اذهب إلى "App Privacy"
2. ملأ استبيان الخصوصية:
   - Does your app collect user data? **No**
   - Does your app use encryption? **Yes**
   - Does your app track users? **No**

### الخطوة 7: الصور (Screenshots)

1. اذهب إلى "App Preview and Screenshots"
2. أضف صور للتطبيق بحجم **1242 × 2688 بكسل**
3. أضف وصف لكل صورة
4. يجب أن تكون صورة واحدة على الأقل

**ملاحظة:** إذا لم تكن لديك صور، يمكنك استخدام أداة تصميم مثل Figma أو Canva

### الخطوة 8: الإصدار (Version Release)

1. اختر "Prepare for Submission"
2. تأكد من أن جميع الحقول مكتملة (علامات خضراء)
3. أضف ملاحظات الإصدار (Release Notes):

```
الإصدار الأول من تطبيق Mukh!

المميزات:
- محادثات ذكية مع الذكاء الاصطناعي
- حفظ المحادثات تلقائياً
- واجهة جميلة وسهلة الاستخدام
- دعم اللغة العربية
```

---

## المرحلة السابعة: الإرسال للمراجعة

### الخطوة 1: التحقق النهائي

قبل الإرسال، تأكد من:

- ✅ جميع الحقول مكتملة
- ✅ الصور بجودة عالية
- ✅ الوصف واضح وجذاب
- ✅ لا توجد أخطاء في البناء
- ✅ الأيقونة احترافية

### الخطوة 2: الإرسال

1. انقر "Submit for Review"
2. أجب على الأسئلة الأمنية:
   - Does your app use encryption? **Yes**
   - Does your app access health data? **No**
   - Does your app contain advertising? **No**

3. انقر "Submit"

### الخطوة 3: المراجعة

- **المدة المتوقعة:** 24-48 ساعة
- **في بعض الأحيان:** حتى 5 أيام
- ستتلقى بريد إلكتروني بالنتيجة

---

## استكشاف الأخطاء الشائعة

### خطأ: "Invalid Provisioning Profile"

**الحل:**
1. تأكد من أن Bundle ID يطابق في Xcode و App Store Connect
2. أعد تحميل Provisioning Profile
3. اختر "Automatically manage signing"

### خطأ: "Certificate not valid"

**الحل:**
1. تأكد من أن الشهادة لم تنته صلاحيتها
2. أنشئ شهادة جديدة إذا لزم الأمر
3. أعد تحميل Provisioning Profile

### خطأ: "App rejected"

**الحل:**
1. اقرأ رسالة الرفض بعناية
2. أصلح المشاكل المذكورة
3. أعد الإرسال

### خطأ: "Build failed"

**الحل:**
```bash
flutter clean
flutter pub get
cd ios
pod install --repo-update
cd ..
```

---

## بعد الموافقة

1. ستتلقى بريد إلكتروني بالموافقة
2. التطبيق سيظهر على App Store تلقائياً
3. يمكنك تتبع الإحصائيات على App Store Connect
4. راقب التقييمات والتعليقات

---

## نصائح مهمة

- ✅ اختبر التطبيق جيداً قبل الإرسال
- ✅ استخدم أيقونة احترافية
- ✅ اكتب وصف واضح وجذاب
- ✅ أضف صور عالية الجودة
- ✅ تأكد من توافق الخصوصية
- ✅ اختبر على أجهزة حقيقية
- ✅ اقرأ إرشادات Apple Review بعناية

---

## المراجع

- [Apple Developer Documentation](https://developer.apple.com/documentation/)
- [Flutter iOS Deployment](https://flutter.dev/docs/deployment/ios)
- [App Store Connect Help](https://help.apple.com/app-store-connect/)
- [App Review Guidelines](https://developer.apple.com/app-store/review/guidelines/)

---

**تم إعداد هذا الدليل لمشروع Mukh Flutter**

**للأسئلة والدعم:**
- البريد الإلكتروني: msmbm2003@gmail.com
- GitHub: https://github.com/s200077761/mukh-flutter
