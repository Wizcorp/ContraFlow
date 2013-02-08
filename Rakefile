
target='origin'

namespace :pages do


  task :build do 
    system "git checkout gh-pages"
    system "yard"
    system "git add doc index.html"
    system "git commit -m 'update documentation'"

  end

  desc "Push gh-pages branch with latest docs"
  task :publish => :build do 
    system "git push #{target} gh-pages"
    system "git checkout master"
  end

  namespace :publish do 
    
    desc "Push documetnation to upstream repo gh-pages"
    task :upstream => :build do
      target='upstream'
      Rake::Task["pages:publish"].invoke 
    end

  end

end
