module Filterable
  extend ActiveSupport::Concern

  class_methods do
    
    # Parameters in the form of:
    #   { [table]: { [field]: { [operator]: [value] }}}
    #
    # e.g.:
    #   { courses: { name: { likeic: 'John' }}}
    #   { sessions: { start: { gte: DateTime.now - 1.days, lte: DateTime.now }}}
    #
    # Wherein, table is optional and defaults to self.table_name
    def filter(params)
      query = self.where(nil)
      
      params.each do |first|
        first[1].each do |second|
          if second[1].is_a?(Hash)
            second[1].each do |operator, value| 
              next if value.nil?
              filter = Filter.new(first[0], second[0], operator, value)
              query = query.where(filter.build)
            end
          else
            next if second[1].nil?
            filter = Filter.new(self.table_name, first[0], second[0], second[1])
            query = query.where(filter.build)
          end
        end
      end
      query
    end
  end
end