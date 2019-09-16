require 'rails_helper'

RSpec.describe ProductImage, type: :model do

  context 'callbacks' do
    it { is_expected.to callback(:delete_records).after(:update) }
  end
end
