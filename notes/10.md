# Routing

```
get '/patients/:id', to: 'patients#show'
get 'profile', to: :show

get '/patients/:id', to: 'patients#show', as: 'patient'
<%= link_to 'Patient Record', patient_path(@patient) %>
```

## Links for resources
```
resources :photos

GET			/photos				index	display a list of all photos
GET			/photos/new			new		return an HTML form for creating a new photo
POST		/photos				create	create a new photo
GET			/photos/:id			show	display a specific photo
GET			/photos/:id/edit	edit	return an HTML form for editing a photo
PATCH/PUT	/photos/:id			update	update a specific photo
DELETE		/photos/:id			destroy	delete a specific photo
```


## Links for resource
```
resource :geocoder

GET			/geocoder/new	new		return an HTML form for creating the geocoder
POST		/geocoder		create	create the new geocoder
GET			/geocoder		show	display the one and only geocoder resource
GET			/geocoder/edit	edit	return an HTML form for editing the geocoder
PATCH/PUT	/geocoder		update	update the one and only geocoder resource
DELETE		/geocoder		destroy	delete the geocoder resource
```

## Controller Namespaces and Routing
```
namespace :admin do
  resources :posts, :comments
end

GET			/admin/posts			index		admin_posts_path
GET			/admin/posts/new		new			new_admin_post_path
POST		/admin/posts			create		admin_posts_path
GET			/admin/posts/:id		show		admin_post_path(:id)
GET			/admin/posts/:id/edit	edit		edit_admin_post_path(:id)
PATCH/PUT	/admin/posts/:id		update		admin_post_path(:id)
DELETE		/admin/posts/:id		destroy		admin_post_path(:id)
```

```
scope '/admin' do
  resources :posts, :comments
end

GET			/admin/posts			index	posts_path
GET			/admin/posts/new		new		new_post_path
POST		/admin/posts			create	posts_path
GET			/admin/posts/:id		show	post_path(:id)
GET			/admin/posts/:id/edit	edit	edit_post_path(:id)
PATCH/PUT	/admin/posts/:id		update	post_path(:id)
DELETE		/admin/posts/:id		destroy	post_path(:id)
```

## Nested Resources
```
class Magazine < ActiveRecord::Base
  has_many :ads
end
 
class Ad < ActiveRecord::Base
  belongs_to :magazine
end


resources :magazines do
  resources :ads
end


GET	/magazines/:magazine_id/ads	index	display a list of all ads for a specific magazine
GET	/magazines/:magazine_id/ads/new	new	return an HTML form for creating a new ad belonging to a specific magazine
POST	/magazines/:magazine_id/ads	create	create a new ad belonging to a specific magazine
GET	/magazines/:magazine_id/ads/:id	show	display a specific ad belonging to a specific magazine
GET	/magazines/:magazine_id/ads/:id/edit	edit	return an HTML form for editing an ad belonging to a specific magazine
PATCH/PUT	/magazines/:magazine_id/ads/:id	update	update a specific ad belonging to a specific magazine
DELETE	/magazines/:magazine_id/ads/:id	destroy	delete a specific ad belonging to a specific magazine


resources :publishers do
  resources :magazines do
    resources :photos
  end
end
```

## Shallow nesting
```
resources :posts do
  resources :comments, only: [:index, :new, :create]
end
resources :comments, only: [:show, :edit, :update, :destroy]

resources :posts do
  resources :comments, shallow: true
end

resources :posts, shallow: true do
  resources :comments
  resources :quotes
  resources :drafts
end

shallow do
  resources :posts do
    resources :comments
    resources :quotes
    resources :drafts
  end
end

scope shallow_path: "sekret" do
  resources :posts do
    resources :comments, shallow: true
  end
end
```

## Routing concerns
```
concern :commentable do
  resources :comments
end
 
concern :image_attachable do
  resources :images, only: :index
end



resources :messages, concerns: :commentable
 
resources :posts, concerns: [:commentable, :image_attachable]



resources :messages do
  resources :comments
end
 
resources :posts do
  resources :comments
  resources :images, only: :index
end


namespace :posts do
  concerns :commentable
end
```


## Links
```
<%= link_to 'Ad details', magazine_ad_path(@magazine, @ad) %>
<%= link_to 'Ad details', url_for([@magazine, @ad]) %>
<%= link_to 'Ad details', [@magazine, @ad] %>
<%= link_to 'Magazine details', @magazine %>
<%= link_to 'Edit Ad', [:edit, @magazine, @ad] %>
```

## Adding More RESTful Actions
```
resources :photos do
  member do
    get 'preview'
  end
end

resources :photos do
  get 'preview', on: :member
end

resources :photos do
  collection do
    get 'search'
  end
end

resources :photos do
  get 'search', on: :collection
end
```


```
get ':controller(/:action(/:id))'

get ':controller(/:action(/:id))', controller: /admin\/[^\/]+/

get ':controller/:action/:id/with_user/:user_id'

```

## HTTP Verb Constraints
```
match 'photos', to: 'photos#show', via: [:get, :post]

match 'photos', to: 'photos#show', via: :all
```

## Segment Constraints
```
get 'photos/:id', to: 'photos#show', constraints: { id: /[A-Z]\d{5}/ }

get '/stories', to: redirect('/posts')
get '/stories/:name', to: redirect('/posts/%{name}')
get '/stories/:name', to: redirect {|params, req| "/posts/#{params[:name].pluralize}" }


root to: 'pages#main'
root 'pages#main' # shortcut for the above
```

