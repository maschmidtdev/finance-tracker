FactoryBot.define do
  factory :stock do
    name { 'Microsoft Corporation' }
    ticker { 'MSFT' }
    last_price { 337.99 }
  end
end