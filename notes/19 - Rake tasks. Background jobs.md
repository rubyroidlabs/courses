# Rake
## Standalone

Rake is a Make-like program implemented in Ruby. Tasks and dependencies are specified in standard Ruby syntax.

### Default task
```
task default: %w[hello]

task :hello do
  puts 'Hi!'
end

task :multiply do
  puts 123 * 2
end

```

```
rake
rake hello
rake multiply
```

### Namespace
```
  namespace :morning do
    task :turn_of_alarm
    ....
  end
```

### Invoke task
```
  namespace :afternoon do
    task :make_coffee do
      Rake::Task['morning:make_coffee'].invoke
      puts "Ready for the rest of the day!"
    end
  end
  ```

## With Rails

### Useful tasks
```
rake -T

rake db:create                       
rake db:drop                           
rake db:migrate
rake db:migrate:status
rake db:rollback
rake db:seed
rake middleware
rake notes
rake routes
rake secret
rake stats
rake test
rake assets:precompile
```

### Files
```
Rakefile
lib/tasks/*.rake
```

### Custom rake task

```
namespace :my do
  desc "This task does nothing"
  task :nothing do
    # Seriously, nothing
  end
end
```

```
rake -T
```

# Background jobs Jobs

## Delayed Job

* One thread per process
* Stores tasks in the relational database

## Resque

* One thread per process
* Stores tasks in Redis

## Sidekiq

* Multiple threads per process
* Stores tasks in Redis
* Web interface

# Sidetiq

* Recurrent jobs
* Icecube problems
* Do not use


## Create worker
```
class HardWorker
  include Sidekiq::Worker
  def perform(name, count)
    # do something
  end
end
```

## Call worker
```
HardWorker.perform_async('bob', 5)
HardWorker.perform_in(5.minutes, 'bob', 5)
User.delay.do_some_stuff(current_user.id, 20)
```

## Retries

```
class LessRetryableWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 5 # Only five retries and then to the Dead Job Queue

  def perform(...)
  end
end
```

## Main notes

* Make your job idempotent and transactional
* Make sure to configure retries

## Web UI

```
gem 'sinatra', :require => nil

require 'sidekiq/web'
mount Sidekiq::Web => '/sidekiq'
```

```
<%= link_to 'Monitoring', sidekiq_web_path %>
```

```
# config/routes.rb
authenticate :user, lambda { |u| u.admin? } do
  mount Sidekiq::Web => '/sidekiq'
end
```

# Whenever

* Cron humanized api
* Custom jobs
* After 25 retries your job will go to dead queue
* After 6 month job will be discarded


BAD:
```
every 3.hours do
  runner "MyModel.some_process"
  rake "my:rake:task"
  command "/usr/bin/my_great_command"
end

every 1.day, :at => '4:30 am' do
  runner "MyModel.task_to_run_at_four_thirty_in_the_morning"
end

```

GOOD:
```
job_type :sidekiq, "export PATH=your_path:$PATH; cd /var/www/unicorn/current && RAILS_ENV=#{environment} bundle exec sidekiq-client :task :output"

every 3.minutes, :roles => [:app] do
  sidekiq "-q queue1 push Cache::LiveWorker"
end

```