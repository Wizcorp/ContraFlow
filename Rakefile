
target='origin'


Kernel.trap("EXIT") do
  Rake::Task[:final].invoke
end

task :final do
  sh "rm -rf #{$temp}"
end

namespace :pages do


  task :tempdir do 
    $temp = %x{mktemp -d /tmp/yarddocs-XXXX}.chomp.strip
  end

  task :build => :tempdir do 
    sh "yard --output-dir #{$temp}"
    sh "git checkout gh-pages"
    sh "rm -rf doc && cp -r ${temp} doc"
    sh "git add doc index.html"
    sh "git commit -m 'update documentation'"

  end

  desc "Push gh-pages branch with latest docs"
  task :publish => :build do 
    sh "git push #{target} gh-pages"
    sh "git checkout master"
  end

  namespace :publish do 
    
    desc "Push documetnation to upstream repo gh-pages"
    task :upstream => :build do
      target='upstream'
      Rake::Task["pages:publish"].invoke 
    end

  end

end
