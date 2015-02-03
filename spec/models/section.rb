describe 'Section' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Section entity' do
    Section.entity_description.name.should == 'Section'
  end
end
