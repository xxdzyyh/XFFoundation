Pod::Spec.new do |s|

  s.name         = "XFFoundation"
  s.version      = "0.0.1"
  s.summary      = "不同的项目都可以用的项目基础库"

  s.description  = <<-DESC
  						如果你有更好的想法，可以聊聊怎么去做
                   DESC

  s.homepage     = "https://github.com/xxdzyyh/XFFoundation"

  s.license      = "MIT (xf)"
  s.author             = { "xxdzyyh" => "xxdzyyh@163.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/xxdzyyh/XFFoundation.git", :tag => "0.0.1" }
  s.public_header_files = 'Header/*.h'

  s.subspec 'Base' do |spec| 
  	spec.source_files = 'Base/*'
  end

  s.subspec 'View' do |spec| 
  	spec.source_files = 'View/*'
  end

  s.subspec 'ViewController' do |spec| 
  	spec.source_files = 'ViewController/*'
  end

  s.subspec 'Plugin' do |spec| 
  	spec.source_files = 'Plugin/*'
  end

  s.dependency 'YYImage'

end
