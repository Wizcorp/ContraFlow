
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
    
    desc "Push documetnation to upstream repo gh-pages"
    task :upstream => :build do
      target='upstream'
      Rake::Task["pages:publish"].invoke 
    end

  end

end
