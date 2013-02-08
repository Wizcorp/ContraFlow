
target='origin'

namespace :pages do

  task :build do 
    sh "yard"
    sh "(cd doc && git add . && git commit -m 'update documentation')"
  end

  desc "Push gh-pages branch with latest docs"
  task :publish => :build do 
    sh "(cd doc && git push #{target} gh-pages)"
  end

  namespace :publish do 

    desc "Push to both origin and upstream"
    task :all => :build do 
      Rake::Task["pages:publish"].invoke 
      target='upstream'
      Rake::Task["pages:publish"].reenable
      Rake::Task["pages:publish"].invoke 
    end

    desc "Push documetnation to upstream repo gh-pages"
    task :upstream => :build do
      target='upstream'
      Rake::Task["pages:publish"].invoke 
    end

  end

end
