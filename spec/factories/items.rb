FactoryBot.define do
  factory :item do
    name { "Wilderness Survival" }
    description { "This is a description of the wilderness survival class that Lost Outpost is so famous for." }
    unit_price { 1.5 }
    merchant { nil }
    #may need to remove nil in order to create a merchant automatically for items.
  end
end
