# frozen_string_literal: true

# называем модель CalcuatorResult (не наследуемся от ApplicationRecord)
class CalculatorResult
  include ActiveModel::Model # примешиваем методы для модели ActiveModel
  include ActiveModel::Validations # примешиваем методы для валидаций из ActiveModel

  attr_accessor :numbers # создаем аттрибуты модели руками, так как здесь нет связи с таблицей в БД

  validates :numbers, presence: { message: 'не может быть пустым' } # проверка на обязательное наличие полей
  validates :numbers, format: { with: /\d/, message: 'должно быть числом' }

  # выполняем расчет сразу в модели, а не в контроллере
  def result
    x.to_f.send(operation, y.to_f)
  end
end
