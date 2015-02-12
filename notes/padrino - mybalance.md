# Padriono balance 
## Create application

To create padrino app:

```
padrino g project my_balance -d activerecord -a mysql2 -s jquery -e slim -b
```

Then we should create migration:

```
padrino g migration CreateTransations
```

The content of the migration:

```
class CreateTransations < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.integer :amount, null: false
      t.string :note, null: false
      t.timestamps
    end
  end

  def self.down
  end
end
```

Now we can create and migrate the database:

```
rake db:create db:migrate
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
h1 My Balanse

= link_to 'Transactions', url_for(:transactions, :index)
```

## Create transactions

It's the time for transactions model:

```
padrino g model Transaction

```

It will generate the migration file also. So you should not bother about it. Here is the transaction model:

```
class Transaction < ActiveRecord::Base
  validates :amount, :note, presence: true
end
```

Here is the basic transactions controller:

```
MyBalance::App.controller :transactions do
  get :index do
    @transactions = Transaction.all

    render 'transactions/index'
  end

  get :new do
    @transaction = Transaction.new

    render 'transactions/new'
  end

  post :create do
    @transaction = Transaction.new(params[:transaction])
    if @transaction.save
      redirect_to 'transactions'
    else
      render 'transactions/new'
    end
  end
end
```

It relies on `index.slim` view:

```
h1 Transactions

table
  th
    td ID
    td Amount
    td Note
  - @transactions.each do |transaction|
    tr
      td = transaction.id
      td = transaction.amount
      td = transaction.note

= link_to 'Add new', url_for(:transactions, :new)
```

And on `new.slim`:
```
h1 New Transaction
= form_for @transaction, :create do |f|
  .errors
    - @transaction.errors.full_messages.each do |message|
      .error = message

  = f.label :amount
  = f.text_field :amount

  = f.label :note
  = f.text_field :note

  = f.submit 'Create'

= link_to 'Back', url_for(:transactions, :index)
```

## Create users

We can create users now. Let simplify the things for now and omit any password digest, encryption and salt. That migration will create users table:

```
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email, null: false
      t.string :password, null: false
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
```

And the model:

```
class User < ActiveRecord::Base
  validates :email, :password, presence: true

  def self.authenticate(email, password)
    User.find_by email: email, password: password
  end
end
```

## Authentication

After that we will need authentication solution. First of all we will add gem to our Gemfile:

```
gem 'padrino-warden', :github => 'jondot/padrino-warden'
```

After that we will open our `app.rb` and add some lines there:

```
    register Padrino::Warden


    Warden::Strategies.add(:password) do
      def valid?
        params["email"] || params["password"]
      end

      def authenticate!
        u = User.authenticate(params["email"], params["password"])
        u.nil? ? fail!("Could not log in") : success!(u)
      end
    end

    Warden::Manager.serialize_into_session do |user|
      user.id
    end

    Warden::Manager.serialize_from_session do |id|
      User.find_by(id)
    end
```

Also we should add a form for login action:

```
= form_tag url(:sessions, :login), :method=>:post
  = email_field_tag :email
  = password_field_tag :password
  = submit_tag
```

## Admin part

First of all we have to generate padrino admin:

```
padrino g admin
```