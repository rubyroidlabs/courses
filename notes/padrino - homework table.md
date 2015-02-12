# Padriono balance 
## Create application

To create padrino app:

```
padrino g project my_balance -d activerecord -a mysql2 -s jquery -e slim -b
```

## RVM settings

Optionally we can add `.ruby-version` and `.ruby-gemset` files:

__.ruby-version__

```
2.1.5
```

__.ruby-gemset__

```
courses-my-balance
```

## Home controller & views
Lets add home controller now:

```
MyBalance::App.controller do
  get :index do
    render 'home/index'
  end
end
```

And the home view:

```
h1 HOMEWORK TABLE
```

## Admin part

First of all we have to generate padrino admin:

```
padrino g admin
```

## Protect routes

Now we are ready to create role-specific routes:

```
 class Admin < Padrino::Application
  register Padrino::Admin::AccessControl
   
  enable :authentication
  disable :store_location
  set :login_page, "/admin/sessions/new"

  access_control.roles_for :admin do |role|
    role.project_module :settings, "/admin"
  end

  access_control.roles_for :student do |role|
    role.project_module :posts, "/posts"
    role.project_module :categories, "/categories"
  end
end

```

##Setup proper redirect for simple users

```
      if account.role.to_s == 'admin'
        redirect url(:base, :index)
      else
        redirect '/'
      end
```

