class Form
  extend ActiveModel::Naming

  attr_reader :errors

  def initialize
    @errors = ActiveModel::Errors.new(self)
  end

  def current_user
    return RequestRegistry.current_user || User.find_by(username: 'guest')
  end

  def transaction(model)
    model.transaction do
      model.created_by = self.current_user.email if not model.persisted? and self.respond_to?(:created_by)
      model.updated_by = self.current_user.email if self.respond_to?(:updated_by)
      yield
    end
  end

  def create
    return self.save if self.respond_to?(:save)
  end

  def update
    return self.save if self.respond_to?(:update)
  end

  def save_associations(relation, props)
    return true if props.blank?

    result = true
    props.each do |prop|
      obj = relation.new 
      obj = relation.find(prop[:id]) if prop[:id].present?
      obj.assign_attributes(prop)

      result &&= self.try_save(obj)  
    end
    return result
  end

  def save_related(klass, prop)
    return true if prop.blank?

    obj = klass.new
    obj = klass.find(prop[:id]) if prop[:id].present?
    obj.assign_attributes(prop)

    return self.try_save(obj)
  end

  protected
    def try_save(model)
      return true if model.save
      @errors.merge!(model.errors)
      return false
    end
end