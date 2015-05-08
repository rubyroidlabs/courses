require_relative "train"
require "minitest/autorun"

class TrainMaster
  def initialize(train)
    @train = train
  end

  def runTrain
    @train.run
    getTrainState
  end

  def stopTrain
    @train.stop
    getTrainState
  end

  def getTrainState
    @train.state
  end
end

describe TrainMaster, :runTrain do
  it "should invoke the appropriate method on the train" do
    @train = Minitest::Mock.new
    @train_master = TrainMaster.new @train
    @train.expect :run, true
    @train.expect :state, :running

    @train_master.runTrain

    @train.verify
  end
end
