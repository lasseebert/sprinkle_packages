require_relative 'test_helper'
require 'sprinkle_packages'

describe SprinklePackages do
  it "loads the packages" do
    Sprinkle::Package::PACKAGES.count.must_be :>, 0
  end
end
