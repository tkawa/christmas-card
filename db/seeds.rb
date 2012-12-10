require 'factory_girl'

factory_names = {
  destination: 1..2,
  card: 1..1,
  member: 1..3,
  message: 1..1,
  reply: 1..1
}

factory_names.each do |model, range|
  model.to_s.camelize.constantize.delete_all
  range.each do |i|
    FactoryGirl.create("#{model.to_s}_#{i}".to_sym)
  end
end
