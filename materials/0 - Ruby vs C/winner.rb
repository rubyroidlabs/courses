(1..40).to_a.shuffle.select{|i| i % 2 == (Time.now.to_i.odd? ? 0 : 1) }.shuffle.select.with_index{|num, i| i % 2 == (Time.now.to_i.odd? ? 0 : 1)}.shuffle.sample
