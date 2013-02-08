

namespace :docs do


  task :build do 
    system "yard"
    system "git checkout gh-pages"
    system "git add doc index.html"
    system "git commit -m 'update documentation'"

  end

  desc "Push gh-pages branch with latest docs"
  task :publish => :build do 
    system "git push origin gh-pages"
    system "git checkout master"
  end

  namespace :publish do 
    
    desc "Push documetnation to upstream repo gh-pages"
    task :upstream => :build do 
      system "git push origin gh-pages"
      system "git checkout master"
    end

  end

end
