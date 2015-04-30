class AppProperties
  ID    = 'com.rails-junior.app'
  NAME    = 'Ruby Knowledge Test'
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
    'icons/j-way-icon-iphone.png',
    'icons/j-way-icon-iphone-retina.png'
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
