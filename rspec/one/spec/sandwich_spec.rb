Sandwich = Struct.new(:taste, :toppings)
RSpec.describe 'An ideal Sandwich' do
    # Using helper methods to reduce code duplication
    # def sandwich
    #     @sandwich ||= Sandwich.new('delicious', [])
    # end

    # Sharing Objects with let
    let (:sandwich) { Sandwich.new('delicious', []) }

    # Using Hooks to reduce code duplication
    # before { @sandwich = Sandwich.new('delicious', [])} 
    it 'is delicious' do
        # sandwich = Sandwich.new('delicious', [])
        taste = sandwich.taste
        expect(taste).to eq('delicious')
    end

    it 'lets me add toppings' do
        # sandwich = Sandwich.new('delicious', [])
        sandwich.toppings << 'cheese'
        toppings = sandwich.toppings
        # expect(toppings).to eq('cheese')
        expect(toppings).not_to be_empty
    end
end