# @title Installing Contra-Flow

This describes basic installation of Contra Flow. For configuration see {file:docs/CONFIG.md}

Installation
======================

One step
-----------

If you have Ruby and MySQL installed, installing Contra-Flow is simply installed as:

```
    git clone <repository>
    bundle install
```    

Detailed
-----------

These instructions are given here for MacOSX, but instructions for Linux or other UNIX'es should be quite similar. Leaving this as an exercise for the user.

### Get Ruby. 

  This was developed and tested with Ruby 1.9.3, should work with any recent version of 1.9. It was not tested with Ruby 1.8, and most probably will not work with it. 

  Easiest way to get Ruby is to install RVM:

* Installing RVM:
  
    On mac (no need to be Root), run exactly the string below:

````shell  
    bash < <(curl -s https://raw.github.com/wayneeseguin/rvm/master/binscripts/rvm-installer )
````      

  - Source RVM config (or run `exec bash`):

````shell  
         souce ~/.rvm/bin/rvm
````

* Install Ruby:
  
````shell  
      rvm install ruby-1.9.3-p194
      rvm use ruby-1.9.3-p194 --default
````      
      
This will take some time to compile and install.

### Install MySQL
*Note*: on a Mac you would need to install MySQL first, this is easy done by `homebrew`:
    
````shell    
      brew install mysql
````

Install Contra-flow as descibed in the chapter above.

