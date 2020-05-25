Pod::Spec.new do |s|
    s.name         = "ReactiveCocoaLayout"
    s.version      = "0.4"
    s.summary      = "Reactive layout framework built on top of ReactiveCocoa."
    s.description  = <<-DESC
                        ReactiveCocoaLayout is a framework for describing Cocoa and Cocoa Touch layouts in a reactive way, based on ReactiveCocoa.
                        DESC
    s.homepage     = "https://github.com/rannger/ReactiveCocoaLayout"
    s.license      = { :type => "MIT", :file => "LICENSE"}
    s.author       = { "ReactiveCocoa" => "ReactiveCocoa" }
    s.requires_arc = true
    s.source       = { :git => "https://github.com/rannger/ReactiveCocoaLayout.git" }
    s.ios.deployment_target = "6.0"
    s.osx.deployment_target = "10.7"
    s.source_files = "ReactiveCocoaLayout/*.{h,m}"
    s.dependencies "Archimedes"
    s.dependencies "ReactiveObjc", "3.1.1"
    s.ios.frameworks = ["Foundation","QuartzCore","CoreGraphics","UIKit"]
    s.osx.frameworks = ["Foundation","QuartzCore","ApplicationServices","Cocoa"]
    s.ios.exclude_files = ["ReactiveCocoaLayout/NSCell*.{h,m}","ReactiveCocoaLayout/NSControl*.{h,m}","ReactiveCocoaLayout/NSView*.{h,m}"]
    s.osx.exclude_files = "ReactiveCocoaLayout/UIView*.{h,m}"
    s.prepare_command = "find . \\( -regex '.*EXT.*\\.[mh]$' -o -regex '.*metamacros\\.[mh]$' \\) -execdir mv {} RAC{} \\;\n    find . -regex '.*\\.[hm]' -exec sed -i '' -E 's@\"(EXT.*|metamacros)\\.h\"@\"RAC\\1.h\"@' {} \\;\n    find . -regex '.*\\.[hm]' -exec sed -i '' -E 's@<ReactiveCocoa/(EXT.*)\\.h>@<ReactiveCocoa/RAC\\1.h>@' {} \\;\n",
    "prefix_header_contents": "#ifdef __OBJC__\n#import <ReactiveCocoa/ReactiveCocoa.h>\n#import <ReactiveCocoaLayout/ReactiveCocoaLayout.h>\n#import <Archimedes/Archimedes.h>\n#ifdef __IPHONE_OS_VERSION_MIN_REQUIRED\n  #import <CoreGraphics/CoreGraphics.h>\n#elif TARGET_OS_MAC\n  #import <ApplicationServices/ApplicationServices.h>\n#endif\n#import <QuartzCore/QuartzCore.h>\n#endif\n\n"
end