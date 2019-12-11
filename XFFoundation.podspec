Pod::Spec.new do |s|

  s.name         = "XFFoundation"
  s.version      = "0.0.1"
  s.summary      = "不同的项目都可以用的项目基础库，主要为了快速完成新的项目"

  s.description  = <<-DESC
  						        如果你有更好的想法，可以聊聊怎么去做
                   DESC

  s.homepage     = "https://github.com/xxdzyyh/XFFoundation"

  s.license      = "MIT (xf)"
  s.author             = { "xxdzyyh" => "xxdzyyh@163.com" }

  s.platform     = :ios, "7.0"

  s.source       = { :git => "https://github.com/xxdzyyh/XFFoundation.git", :branch => "master" }
  s.public_header_files = 'Header/*.h'

  s.source_files = 'header/*'

  s.subspec 'Base' do |spec| 
  	spec.source_files = 'Base/*'
  end

  s.subspec 'Marco' do |spec|
    spec.source_files = 'Marco/*'
  end

  s.subspec 'Category' do |spec|
    spec.source_files = 'Category/*'
  end

  s.subspec 'Tools' do |spec|
    spec.source_files = 'Tools/**/*'
  end

  s.subspec 'AccountManager' do |spec|

    spec.source_files = 'AccountManager/*'
  end

  s.subspec 'Request' do |spec|
    spec.source_files = 'Request/**/*'
  end

  s.subspec 'View' do |spec| 
  	spec.source_files = 'View/*'
  end

  s.subspec 'ViewController' do |spec| 
  	spec.source_files = 'ViewController/**/*'
  end

  s.subspec 'Plugin' do |spec| 
  	spec.source_files = 'Plugin/*'
  end

  s.dependency 'AFNetworking'
  s.dependency 'Masonry'
  s.dependency 'MBProgressHUD'
  s.dependency 'MJRefresh'
  s.dependency 'SDCycleScrollView'
  s.dependency 'SVProgressHUD'
  s.dependency 'YYModel'
  s.dependency 'IQKeyboardManager'
  s.dependency 'SAMKeychain'

end
