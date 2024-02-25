# image_picker_camera_gallery

This app manages camera and gallery permissions, and utilizes the Image Picker and Image Cropper libraries to select and set images from the gallery or camera.

## Getting Started

### first add this lines of codes to your pubspec.yaml

```bash
  image_picker: ^1.0.7
  image_cropper: ^5.0.1
  permission_handler: ^11.0.1
```
    
### put the below code in the _android/app/src/main/AndroidManifest.xml_
#### first: inside manifest tag add:

```bash
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.WRITE_EXTERNAL_STORAGE"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"/>
```

#### second: inside application tag add:
```bash
    <activity
    android:name="com.yalantis.ucrop.UCropActivity"
    android:screenOrientation="portrait"
    android:theme="@style/Theme.AppCompat.Light.NoActionBar"/>
```




      