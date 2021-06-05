require 'secretdiary'

describe SecretDiary do
  let(:message) { "I love McDonalds!" }
  let(:page) { double('page') }
  subject { described_class.new(page) }

  context 'initially locked' do
    it 'raises an error when trying to add an entry' do
      expect {subject.add_entry(message)}.to raise_error 'It is locked!'
    end

    it 'raises an error when trying to get entries' do
      expect {subject.get_entries}.to raise_error 'It is locked!'
    end
  end

  context 'unlocked' do
    before do
      subject.unlock
      allow(page).to receive(:add_entry).and_return message
      allow(page).to receive(:get_entries).and_return message
    end

    it 'can add an entry' do
      expect(subject.add_entry(message)).to eq message
    end

    it 'can retrieve entries' do
      subject.add_entry(message)

      expect(subject.get_entries).to eq message
    end

    context 'can lock the diary again' do
      before do
        subject.lock
      end

      it 'raises an error when trying to add an entry' do
        expect {subject.add_entry(message)}.to raise_error 'It is locked!'
      end
  
      it 'raises an error when trying to get entries' do
        expect {subject.get_entries}.to raise_error 'It is locked!'
      end
    end

  end
end

# describe Page do
#   let(:message) { "McNuggets are like my family." }
  
#   it 'can add_entries' do
#     expect(subject.add_entry(message)).to eq message
#   end

#   it 'can read entries' do
#     subject.add_entry(message)
#     expect(subject.get_entries).to eq message
#   end

# end