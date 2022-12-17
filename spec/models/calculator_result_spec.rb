# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CalculatorResult, type: :model do
  # тестируем валидации
  describe 'validations' do
    # тестируем, что модель проверяет наличие параметров и выводит соответствующее сообщение
    it { should validate_presence_of(:numbers).with_message('не может быть пустым') }

    # тестируем валидации, когда x и y не являются числами
    context 'when x is not digits' do
      it { should_not allow_value(Faker::Lorem.word).for(:numbers) }
    end

    # тестируем валидации, когда x и y являются числами
    context 'when x is digits' do
      it { should allow_value(Faker::Number.number).for(:numbers) }
    end
  end

  # тестируем работу метода result

end
