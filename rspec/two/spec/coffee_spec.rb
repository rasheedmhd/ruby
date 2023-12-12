RSpec.configure do |config|
    config.filter_run_when_matching(focus: true)
    config.example_status_persistence_file_path = 'spec/failed_tests.txt'
end

class  Coffee
  def ingredients
    @ingredients ||= []
  end

  def color
    ingredients.include?(:milk) ? :light : :dark
  end

  def temperature
    ingredients.include?(:milk) ? 190.0 : 205.0
  end

  def add(ingredient)
    ingredients << ingredient
  end

  def price
    1.00 + ingredients.size * 0.25
  end

end



RSpec.describe 'A cup of coffee' do
    let(:coffee) { Coffee.new }

    # you can add a focus: true hash to the test to get focus
    # that way only this test + other focused test run
    it 'costs $1', focus: true do
        expect(coffee.price).to eq(1.00)
    end

    # focused method, runs only 
    # runs only the method with f prepended 
    # as long as config.filter_run_when_matching(focus: true) is true
    fcontext 'with milk' do
        before { coffee.add :milk }

        it 'is light in color' do
            # pending 'Color not yet implemented'
            expect(coffee.color).to be(:light)
        end
        it 'is cooler than 200 degrees Fahrenheit' do
            # pending 'Temperature not yet implemented'
            expect(coffee.temperature).to be < 200.0
        end
        it 'costs $1.25' do
            expect(coffee.price).to eq(1.25)
        end
    end
end

# sleep_spec.rb

RSpec.describe 'The sleep() method' do
    it('can sleep for 0.1 second') { sleep 0.1 }
    it('can sleep for 0.2 second') { sleep 0.2 }
    it('can sleep for 0.3 second') { sleep 0.3 }
    it('can sleep for 0.4 second') { sleep 0.4 }
    it('can sleep for 0.5 second') { sleep 0.5 }
end