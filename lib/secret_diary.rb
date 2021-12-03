# frozen_string_literal: true

class SecretDiary
  attr_reader :entries

  def initialize
    @locked = true
    @entries = []
  end

  def locked?
    @locked
  end

  def lock
    @locked = true
  end

  def unlock
    @locked = false
  end

  def add_entry(entry)
    raise 'Diary Locked, Cannot Add Entry!' if locked?

    @entries << entry
  end

  def my_entries
    raise 'Diary Locked, Cannot Get Entries!' if locked?

    @entries.each_with_index do |entry, _index|
      puts entry.title
    end
  end
end
