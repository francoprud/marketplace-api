require 'rails_helper'

describe Placement do
  let!(:placement) { create(:placement) }

  subject { placement }

  it { should respond_to(:order_id) }
  it { should respond_to(:product_id) }
  it { should respond_to(:quantity) }

  it { should belong_to(:order) }
  it { should belong_to(:product) }
end
