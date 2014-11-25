class MyStruct

  def initialize(hash)
    @hash = hash
    @hash.each do |key, value|
      self.class_eval do
        define_method(key) { @hash[key] }
        define_method("#{key}=") { |v| @hash[key] = v }
      end
    end
  end

end
