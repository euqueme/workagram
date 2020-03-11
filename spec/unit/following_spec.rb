require 'rails_helper'

RSpec.describe Following, type: :model do
  context 'Validation tests' do
    subject { Following.new }
    let(:follower) {User.create(username: 'maru', fullname: "Maria Eugenia Queme")}
    let(:followed) {User.create(username: 'audrey', fullname: "Audrey Odiaka")}

    it 'valid with follower_id and followed_id' do
      subject.follower_id = follower.id
      subject.followed_id = followed.id
      expect(subject).to be_valid
    end

    it 'not valid without follower_id' do
      subject.followed_id = followed.id
      expect(subject).to_not be_valid
    end

    it 'not valid without followed_id' do
      subject.follower_id = follower.id
      expect(subject).to_not be_valid
    end

    it 'adds a new Following' do
      count = Following.count
      subject.update!(follower_id: follower.id, followed_id: followed.id)
      expect(Following.count).to eq(count + 1)
    end
  end

  context 'Custom Validation tests' do
    let(:follower) {User.create(username: 'maru', fullname: "Maria Eugenia Queme")}
    let(:followed) {User.create(username: 'audrey', fullname: "Audrey Odiaka")}

    it 'not valid if follower is already created' do
      Following.create(followed_id: followed.id, follower_id: follower.id)
      subject { Following.create(followed_id: followed.id, follower_id: follower.id)}
      expect(subject).to_not be_valid
    end  

    it 'not valid if followed is already created' do
      Following.create(followed_id: follower.id, follower_id: followed.id)
      subject { Following.create(followed_id: follower.id, follower_id: followed.id)}
      expect(subject).to_not be_valid
    end   
  end

end
