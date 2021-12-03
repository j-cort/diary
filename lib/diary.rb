# frozen_string_literal: true

require_relative 'padlock'

class Diary
  attr_reader :entries, :security

  def initialize(security = Padlock.new)
    @security = security
    @entries = []
  end

  def add_entry(entry)
    raise 'Diary Locked, Cannot Add Entry!' if @security.locked?

    @entries << entry
  end

  def my_entries
    raise 'Diary Locked, Cannot Get Entries!' if @security.locked?

    @entries.each { |entry| puts entry.title }
  end
end
