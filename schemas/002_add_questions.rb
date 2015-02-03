schema '002' do
  entity 'Question' do
    string :question
    string :answer

    belongs_to :section
  end


  entity 'Section' do
    string :name

    has_many :questions
  end
end
