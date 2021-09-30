#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint screen_lock_check.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'screen_lock_check'
  s.version          = '1.0.0'
  s.summary          = 'Screen lock check'
  s.description      = <<-DESC
This plugin allows you to check whether the user has some form of screen lock set on their device: a passcode, a pattern, touch ID or face ID.
                       DESC
  s.homepage         = 'https://www.koahealth.com/'
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'koa-engineering-all@koahealth.com' }
  s.source           = { :http => 'https://github.com/koa-health/screen_lock_check/tree/master' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
end
