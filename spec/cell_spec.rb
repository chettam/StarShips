require_relative 'spec_helper'
require_relative '../models/cell'
describe Cell do

  it "knows if it's not empty" do
    cell = Cell.create(:attacked => true)
    expect(cell).not_to be_empty
  end

  it "knows if it's empty" do
    cell = Cell.create(:attacked => false)
    expect(cell).to be_empty
  end

  it "knows when it's hit" do
    cell = Cell.create(:ship => Ship.new, :attacked => true)
    expect(cell).to be_hit
  end

  it "knows when it's a miss" do
    cell = Cell.create(:attacked => true)
    expect(cell).to be_miss
  end


end