require 'pry'
require 'ostruct'

require_relative '../app/helpers/healthids_helper'

describe 'health id controller' do

  it 'should return an array of facial features' do
    ff = HealthidsHelper.get_facial_features('../public/img/kaleb.jpeg')
    expect(ff.features.is_a? Array)
  end

  let(:sim_obj) do |s|
    s = OpenStruct.new
    s.x = 200
    s.y = 150
    s
  end

  it 'should calculate the hash of a simple array' do

    hashed_key = HealthidsHelper.hash_key([sim_obj])
    expect(hashed_key).to eq "042594340042283794"
  end
end
