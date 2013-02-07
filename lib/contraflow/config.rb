

GOOGLE = { 
  :document => 'RT Workflow Checklist',
  :sheets => [
              'New Employee Task List',
              'Leaving Employee Task List'
             ]
}


RT_CONFIG = { 
  :db => {
    :host => "rt.example.com",
    :database => 'rt',
    :username => 'template_update',
    :password => '<SECRET>'
  },
  # PATH to erd directory relative to the BASE directory of the
  # package
  :erb => "erb"
                                     
}

