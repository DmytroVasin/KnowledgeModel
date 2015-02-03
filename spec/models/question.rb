describe 'Question' do

  before do
    class << self
      include CDQ
    end
    cdq.setup
  end

  after do
    cdq.reset!
  end

  it 'should be a Question entity' do
    Question.entity_description.name.should == 'Question'
  end
end
