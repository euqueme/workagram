require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validation tests' do
    subject { User.new }

    it 'valid with username and fullname' do
      subject.username = 'maru'
      subject.fullname = 'Maria Eugenia Queme'
      expect(subject).to be_valid
    end

    it 'not valid without username' do
      subject.fullname = 'Maria Eugenia Queme'
      expect(subject).to_not be_valid
    end

    it 'not valid without fullname' do
      subject.username = 'maru'
      expect(subject).to_not be_valid
    end

    it 'adds a new User' do
      count = User.count
      subject.update!(username: 'maru', fullname: 'Maria Eugenia Queme')
      expect(User.count).to eq(count + 1)
    end
  end

  context 'Custom Validation tests' do
    subject { User.new }

    it 'not valid if username already exists' do
      User.create(username: 'audrey', fullname: 'Audrey Odiaka')
      subject.username = 'audrey'
      subject.fullname = 'Maria Eugenia Queme'
      expect(subject).to_not be_valid
    end
  end

  context 'Associations tests' do
    subject { User.create(username: 'maru', fullname: 'Maria Eugenia Queme') }
    let(:work) { subject.works.build(text: 'job update', picture: 'xxx.jpg') }
    let(:follow) { subject.following.build(username: 'audrey', fullname: 'Audrey Odiaka') }
    let(:follower) { subject.followers.build(username: 'erik', fullname: 'Erik Nava') }

    it 'has many works' do
      expect(subject.respond_to?(:works)).to be_truthy
      expect(subject.works).to include(work)
    end

    it 'has many following' do
      expect(subject.respond_to?(:following)).to be_truthy
      expect(subject.following).to include(follow)
    end

    it 'has many followers' do
      expect(subject.respond_to?(:followers)).to be_truthy
      expect(subject.followers).to include(follower)
    end
  end
end
