# frozen_string_literal: true

require_relative 'display'

class Calculator
  def initialize
    @answer = nil
  end

  def add(number1, number2)
    @answer = (number1 + number2)
  end

  def subtract(number1, number2)
    @answer = (number1 - number2)
  end

  attr_reader :answer
end
