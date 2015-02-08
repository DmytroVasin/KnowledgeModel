schema '002' do
  entity 'Question' do
    integer32 :id
    string :question
    string :answer

    belongs_to :section
  end


  entity 'Section' do
    string :name

    has_many :questions
  end
end
