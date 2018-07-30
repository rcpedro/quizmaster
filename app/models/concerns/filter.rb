class Filter
  TRANSFORMS = {
    eq:          Proc.new { |field, value| ["#{field} = ?", value] },
    likeic:      Proc.new { |field, value| ["lower(#{field}) like ?", "#{value.downcase}"]  },
    startswith:  Proc.new { |field, value| ["lower(#{field}) like ?", "#{value.downcase}%"] },
    contains:    Proc.new { |field, value| ["lower(#{field}) like ?", "%#{value.downcase}%"] },

    gt:  Proc.new { |field, value| ["#{field} > ?",  value] },
    gte: Proc.new { |field, value| ["#{field} >= ?", value] },
    lt:  Proc.new { |field, value| ["#{field} < ?",  value] },
    lte: Proc.new { |field, value| ["#{field} <= ?", value] },

    sameday:   Proc.new { |field, value| ["date_trunc('day',   #{field})", value.to_date] },
    sameweek:  Proc.new { |field, value| ["date_trunc('week',  #{field})", value.to_date.beginning_of_week] },
    samemonth: Proc.new { |field, value| ["date_trunc('month', #{field})", value.to_date.beginning_of_month] },
    
    in:      Proc.new { |field, value| ["#{field} in (?)", value] },
    isnull:  Proc.new { |field, value| [field, (value.present? and value) ? 'null' : 'not null'] }
  }.with_indifferent_access

  attr_accessor :field, :operator, :value

  def initialize(table, field, operator, value)
    self.field = "#{table}.#{field}"
    self.operator = operator
    self.value = value
  end

  def build
    return nil if self.value.blank?
    return Filter::TRANSFORMS[self.operator].call(self.field, self.value)
  end
end