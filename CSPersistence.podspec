Pod::Spec.new do |s|
  s.name         = "CSPersistence"
  s.version      = "0.0.1"
  s.summary      = "The package of CSPersistence"
  s.homepage     = "https://github.com/lichangsong"
  s.license      = "MIT"
  s.authors      = { 'lichangsong' => 'lcs_lz@163.com'}
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/lichangsong/CSPersistence.git", :tag => s.version }
  s.source_files = 'CSPersistence', 'CSPersistence/**/*.swift'
  s.requires_arc = true
  s.dependency "FMDB"
end