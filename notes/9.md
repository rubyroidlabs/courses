# ActiveRecord


## Basics
### Naming conventions

* Model / Class - Table / Schema
* Foreign keys/Primary keys
* No foreign keys
* created_at/updated_at

```
class Product < ActiveRecord::Base
  self.table_name = "PRODUCT"
  self.primary_key = "product_id"
end
```



## Query API

```
create_table :users do |t|
  t.string :email
  t.string :name
  t.string :password
  t.string :age
  t.boolean :not_nerd
end

create_table :people do |t|
  t.string :name, null: false, limit: 50
end
```

```
100.times do 
  User.create email: Faker::Internet.email,
  			   name: Faker::Name.name,
  			   password: '123456',
  			   age: rand(12..90),
  			   not_nerd: true
end

```

### List of methods
* create_with
* eager_load
* extending
* from
* group +
* having
* includes
* joins
* limit +
* lock
* none + 
* offset +
* order + 
* preload
* readonly
* references
* reorder + 
* reverse_order +
* select + 
* distinct +
* uniq +
* where

```
User.all
User.first[()]
User.take[()]
User.find(2)
User.find_by_age(18) # deprecated
User.find_by(age: 18)
User.find_or_create_by(email: 'ololol@mail.ru')
User.find_each / find_in_batches

User.limit(10)
User.offset(10)
User.order(:age)
```

```
scope = User.limit(10)
scope = scope.offset(10)
scope = scope.order(:age)
scope.reorder(:email).all

User.limit(4).to_sql
User.limit(4).unscoped.to_sql
User.limit(4).unscoped.none.to_sql
User.limit(4).ids

```


```
User.order(age: :desc)
User.order(:age).reverse_order
User.limit(5).select(:name)
User.limit(5).pluck(:name)
User.select(:age).distinct
User.select(:age).uniq
User.group(:age).select('COUNT(*) as number, age as age')
Hash[User.group(:age).select('COUNT(*) as number, age as age').map {|u| [u.age, u.number]}]
Hash[User.group(:age, :id).having('age > 18').map {|u| [u.age, u.number]}]
Hash[User.group(:age, :id).having('age > 18').select('COUNT(*) as number, age as age').map {|u| [u.age, u.number]}]

```

```
User.where(age: 18)
User.where.not(age:18)
User.where(age: 18).where(password: '1234')
User.where(age: 18, email: 'lol@gmail.com')
User.where(age: 18).exists?
age=18; User.where('age >= #{age}');
User.where('age >= ?', 18)
Usere.where('age >= ? OR email ILIKE ?, 18, 'test@gmail.com')
User.where('age < :age, create_at >= :date', {age: 18, date: Time.zone.now})

```


## Validations


* model.errors
* model.valid? || model.invalid?
* shebang methods
* skipping validations


```
class User < ActiveRecord::Base
  validates_presense_of :name
  validates :name, presence: true
  validates :name, absence: true
  validates :not_nerd, acceptance: true
  # validates :email, confirmation: true
  validates :email, format: { with: Devise.regexp}
  validates :not_nerd, inclusion: { in:[true, false]}
  validates :name, length: { minimum: 5, maximum: 120 }
  validates :age, numericality: { only_integer: true, greater_than: 0 }
   validates :name, uniqueness: { scope: :email, case_sensitive: false }
   validates :name, presence: true, if: 

end

class GoodnessValidator < ActiveModel::Validator
  def validate(record)
    if record.name =~ "Evil"
      record.errors[:base] << "This person is evil"
    end
  end
end
 
class User < ActiveRecord::Base
  validates_with GoodnessValidator
end


```

## Scopes

```
class User < ActiveRecord::Base
  default_scope { where("removed_at IS NULL") }
  scope :created_before, ->(time) { where("created_at < ?", time) }
end

```

## Callbacks
http://guides.rubyonrails.org/active_record_callbacks.html

## Creating an Object
* before_validation
* after_validation
* before_save
* around_save
* before_create
* around_create
* after_create
* after_save

### Updating an Object
* before_validation
* after_validation
* before_save
* around_save
* before_update
* around_update
* after_update
* after_save

### Destroying an Object
* before_destroy
* around_destroy
* after_destroy


## Relations

* http://guides.rubyonrails.org/association_basics.html
* belongs_to
* has_one
* has_many
* has_many throught: 
* (table_name)_count - Used to cac* he the number of belonging objects on associations.
* people vs profile
* slavers vs people
* people vs toilets



## Polymorphic associations
(association_name)_type - Stores the type for polymorphic associations.

```
class Picture < ActiveRecord::Base
  belongs_to :imageable, polymorphic: true
end
 
class Employee < ActiveRecord::Base
  has_many :pictures, as: :imageable
end
 
class Product < ActiveRecord::Base
  has_many :pictures, as: :imageable
end

class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string  :name
      t.integer :imageable_id
      t.string  :imageable_type
      t.timestamp
      OR
      t.references :imageable, polymorphic: true
    end
  end
end


```

## STI

class Admin < User
end

## Serialization


## Optimistic lock

lock_version - Adds optimistic locking to a model.

## Nested attributes

## Transactions