# frozen_string_literal: true

require 'padlock'

describe Padlock do
  let(:padlock) { described_class.new }

  describe '#lock' do
    it { should be_locked }

    it 'locks the diary' do
      padlock.unlock
      expect { padlock.lock }.to change { padlock.locked? }.from(false).to(true)
    end
  end

  describe '#unlock' do
    it 'unlocks the diary' do
      expect { padlock.unlock }.to change { padlock.locked? }.from(true).to(false)
    end
  end
end
