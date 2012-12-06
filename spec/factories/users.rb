FactoryGirl.define do 

	factory :user do
		sequence :username do |n|
		  "foo_#{n}"
		end
		password "bar"
    password_confirmation "bar"
		admin false
		factory :admin do
	   admin true
		end
	end


end