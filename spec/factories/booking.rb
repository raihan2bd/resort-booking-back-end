FactoryBot.define do
  factory :booking do
    start_date { '2023-07-02' }
    end_date { '2023-07-04' }
    address { 'loram ipsum random location' }

    association :user
    association :resort, factory: :resort
  end
end
