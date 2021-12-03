# frozen_string_literal: true

require 'secret_diary'

describe SecretDiary do
  let(:diary) { described_class.new }
  let(:entry1) { double('entry1', title: 'funny story', body: "knock, knock. Who's there?") }
  let(:entry2) { double('entry2', title: 'funny story2', body: 'Why did the chicken cross the road?') }

  describe '#lock' do
    it { should be_locked }

    it 'locks the diary' do
      diary.unlock
      expect { diary.lock }.to change { diary.locked? }.from(false).to(true)
    end
  end

  describe '#unlock' do
    it 'unlocks the diary' do
      expect { diary.unlock }.to change { diary.locked? }.from(true).to(false)
    end
  end

  describe '#add_entry' do
    it 'raises an error when diary is locked' do
      expect { diary.add_entry(entry1) }.to raise_error 'Diary Locked, Cannot Add Entry!'
    end

    it "adds entry to diary 'entries' " do
      diary.unlock
      expect { diary.add_entry(entry1) }.to change { diary.entries.last }.from(nil).to(entry1)
    end
  end

  describe '#my_entries' do
    it 'raises an error when diary is locked' do
      expect { diary.my_entries }.to raise_error 'Diary Locked, Cannot Get Entries!'
    end

    it 'prints diary entries to stdout' do
      diary.unlock
      diary.add_entry(entry1)
      diary.add_entry(entry2)
      diary.my_entries
      expect { diary.my_entries }.to output("funny story\nfunny story2\n").to_stdout
    end
  end
end
