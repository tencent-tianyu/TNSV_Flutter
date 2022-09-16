#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint dinsv.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'dinsv'
  s.version          = '0.0.1'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.vendored_frameworks =  'Classes/SDK/*.{framework}'
  s.resource = 'Classes/SDK/*.{bundle}'

  s.source_files = 'Classes/Helpers/*','Classes/*'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'
  s.weak_framework  = "Network"
  s.library   = "c++.1"
  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386',
   'OTHER_LDFLAGS' => '$(inherited) -ObjC'} }
end
