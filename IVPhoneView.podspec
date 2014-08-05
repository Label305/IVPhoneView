Pod::Spec.new do |s|

  s.name         = "IVPhoneView"
  s.version      = "0.1"
  s.summary      = "Basic view containing an iPhone graphic, in which you can place a screenshot. Can be used for onboarding experiences."

  s.description  = <<-DESC
                   View with a nice iPhone container. Use it to display something within an iPhone graphic. Can be used for onboarding experiences.
                   DESC

  s.homepage     = "https://github.com/Label305/IVPhoneView"
  s.license      = { :type => 'Apache License, Version 2.0', :file => 'LICENSE' }
  s.author       = { "Thijs Scheepers" => "thijs@label305.com" }

  s.source       = { :git => "https://github.com/Label305/IVPhoneView.git", :tag => "0.1" }

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'IVPhoneView/IVPhoneView.{h,m}'
  
end