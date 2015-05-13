class Train
  ON_HOLD = :on_hold
  RUNNING = :running

  attr_reader :name, :size, :state

  def initialize(name='Uber train', size=10)
    @name = name
    @size = size
    @state = ON_HOLD
  end

  def run
    @state = RUNNING
  end

  def stop
    @state = ON_HOLD
  end

  def get_to_next_station(distance)
    sleep 0.00002 * distance
  end

  def will_arrive_by_the_end_of_the_day?(tripDuration)
    Time.now + tripDuration <= ::Date.today + 1.day
  end
end
