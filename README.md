# sprout-wrap

[![Build Status](https://travis-ci.org/pivotal-sprout/sprout-wrap.png?branch=master)](https://travis-ci.org/pivotal-sprout/sprout-wrap)

Prepares a Mac running OS X Mountain Lion for Ruby development using [soloist](https://github.com/mkocher/soloist) and [Sprout](https://github.com/pivotal-sprout/sprout)

## Installation

### 1. Install XCode

[![Xcode - Apple](http://r.mzstatic.com/images/web/linkmaker/badge_macappstore-lrg.gif)](https://itunes.apple.com/us/app/xcode/id497799835?mt=12&uo=4)

### 2. Install Command Line Tools
  
  <code>XCode > Preferences > Downloads</code>
  
### 3. Generate rsa key pair for Github authentication
  
    mkdir ~/.ssh
    rsa-keygen -t rsa -b 2048 -C <valid email address> -f ~/.ssh/id_rsa
  Add the <code>.pub </code> key to your Github: <code>Account settings > SSH Keys > Add SSH Key</code>
  
### 4. Clone this project
  
    git clone git@github.com:msainz/sprout-wrap.git
    cd sprout-wrap
  
### 5. Install soloist & and other required gems

    sudo gem install bundler
    bundle

### 6. Place .private_data_bags_key inside sprout-wrap

  Necessary if you plan to use [encrypted data bags](http://ed.victavision.co.uk/blog/post/4-8-2012-chef-solo-encrypted-data-bags)

### 7. Run mysoloist
  
    ./mysoloist
