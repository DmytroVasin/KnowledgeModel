class AppProperties
  ID    = 'com.rails-junior.app'
  NAME    = 'Ruby Rails Test'
  VERSION = '1.0.0'

  def name
    NAME
  end

  def identifier
    ID
  end

  def libraries
    ['/usr/lib/libz.dylib', '/usr/lib/libsqlite3.dylib']
  end

  def icons
    [
      'j-way-icon-iphone-40-small.png',
      'j-way-icon-iphone-40-small@2x.png',
      'j-way-icon-iphone-40-small@3x.png',
      'j-way-icon-iphone-60@2x.png',
      'j-way-icon-iphone-60@3x.png',
      'j-way-icon-iphone-72.png',
      'j-way-icon-iphone-72@2x.png',
      'j-way-icon-iphone-76@.png',
      'j-way-icon-iphone-76@2x.png',
      'j-way-icon-iphone-small.png',
      'j-way-icon-iphone-small@2x.png',
      'j-way-icon-iphone-small@3x.png',
      'j-way-icon-iphone.png',
      'j-way-icon-iphone@2x.png',
    ]
  end

  def devices
    [:iphone]
  end

  def prerendered_icon
    true
  end

  def version
    VERSION
  end

  def dev_version
    [version, short_git_hash].join('.')
  end

  def short_git_hash
    `git log --pretty=format:'%h' -n 1`
  end


  def dev_certificate
    ENV['DEVELOPMENT_CERTIFICATE_NAME']
  end

  def dev_profile_path
    ENV['DEVELOPMENT_PROVISIONING_PROFILE_PATH']
  end

  def release_certificate
    ENV['RELEASE_CERTIFICATE_NAME']
  end

  def release_profile_path
    ENV['RELEASE_PROVISIONING_PROFILE_PATH']
  end
end
