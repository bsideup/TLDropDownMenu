Pod::Spec.new do |s|
  s.name     = 'TLDropDownMenu'
  s.version  = '0.0.1'
  s.platform = :ios, '5.0'
  s.license  = {:type => 'Custom', :text => 'Copyright (C) 2012 Sergey Egorov' }
  s.summary  = 'Drop down menu category from UINavagationBar for UINavigationController'
  s.homepage = 'https://github.com/bsideup/TLDropDOwnMenu'
  s.author   = { 'Sergey Egorov' => 'bsideup@gmail.com' }
  s.source   = { :git => 'https://github.com/bsideup/TLDropDownMenu.git',
		 :commit => 'HEAD' }

  s.source_files = 'TLDropDownMenu/*.{h,m}'
  s.requires_arc = true
end
