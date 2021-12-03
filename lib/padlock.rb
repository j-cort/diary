# frozen_string_literal: true

class Padlock
  def initialize
    @lock = true
  end

  def locked?
    @lock
  end

  def lock
    @lock = true
  end

  def unlock
    @lock = false
  end
end
