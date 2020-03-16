FactoryBot.define do
  factory :task do
    complexity { 1 }
    priority { 1 }
  end

  trait :invalid do
    complexity { 0 }
    priority { nil }
  end
end
