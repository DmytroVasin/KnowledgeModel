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
      'icons/j-way-icon-iphone-40-small.png',
      'icons/j-way-icon-iphone-40-small@2x.png',
      'icons/j-way-icon-iphone-40-small@3x.png',
      'icons/j-way-icon-iphone-60@2x.png',
      'icons/j-way-icon-iphone-60@3x.png',
      'icons/j-way-icon-iphone-72.png',
      'icons/j-way-icon-iphone-72@2x.png',
      'icons/j-way-icon-iphone-76@.png',
      'icons/j-way-icon-iphone-76@2x.png',
      'icons/j-way-icon-iphone-small.png',
      'icons/j-way-icon-iphone-small@2x.png',
      'icons/j-way-icon-iphone-small@3x.png',
      'icons/j-way-icon-iphone.png',
      'icons/j-way-icon-iphone@2x.png',
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
  end

  def dev_profile_path
  end

  def release_certificate
  end

  def release_profile_path
  end
end
